class TransactionsController < ApplicationController

  def new
    @transaction = new_transaction_with_autofill
    if current_user || params[:guest]
      render :new
    else
      redirect_to new_session_path(:restaurant_id => current_restaurant.slug)
    end
  end

  def create
    CompletePurchase.new(current_user, current_order).create(updated_params,
      ->(transaction) {
        session[:current_order] = nil
        flash[:notice] = "Successfully created your order!"
        redirect_to transaction_path(transaction)
      },
      -> {
        flash[:notice] = "There was a problem creating your order!"
        render :new
    })
  end

  def show
    @transaction = Transaction.find_by(id: params[:id])
    if @transaction.order.user_id == 1 || current_user.id == @transaction.order.user_id
      # TODO: this condition makes all guest (order.user_id = 1) accessible to the publid
      render :show
    else
      @transaction = nil
      redirect_to root_path
    end
  end

  private

  def new_transaction_with_autofill
    Transaction.new(user_has_transacted? ? previous_transaction_params : nil)
  end

  def user_has_transacted?
    current_user && !current_user.orders.empty? && current_user.last_transaction
  end

  def previous_transaction_params
    transaction = current_user.last_transaction
    { first_name: transaction.first_name,
      last_name: transaction.last_name,
      email: transaction.email,
      zipcode: transaction.zipcode }
  end

  def updated_params
    transaction_params.merge(:order_id => current_order.id, :result => "success")
  end

  def transaction_params
    params.require(:transaction).permit(:first_name, :last_name, :email, :zipcode)
  end

end

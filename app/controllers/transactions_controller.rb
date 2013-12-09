class TransactionsController < ApplicationController

  def new
    if current_user && !current_user.orders.empty? && current_user.last_transaction 
      transaction = current_user.last_transaction
      @transaction = Transaction.new(first_name: transaction.first_name, 
                                     last_name: transaction.last_name, 
                                     email: transaction.email, 
                                     zipcode: transaction.zipcode)
    else
      @transaction = Transaction.new
    end
    if current_user || params[:guest]
      render :new
    else
      redirect_to new_session_path
    end
  end

  def create
    @transaction = current_order.build_transaction(transaction_params)
    @transaction.update(:order_id => current_order.id)
    if @transaction.save
      @transaction.pay!
      if current_user
        current_order.update(:user_id => current_user.id, :status => "paid")
      else
        current_order.update(:status => "paid")
      end
      session[:current_order] = nil
      OrderMailer.order_confirmation(@transaction).deliver
      flash[:notice] = "Successfully created your order!"
      redirect_to transaction_path(@transaction)
    else
      flash[:notice] = "There was a problem creating your order!"
      render :new
    end
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

  def transaction_params
    params.require(:transaction).permit(:first_name, :last_name, :email, :credit_card_number, :credit_card_expiration, :zipcode)
  end

end

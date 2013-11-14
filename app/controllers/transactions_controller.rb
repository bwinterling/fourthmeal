class TransactionsController < ApplicationController
  
  def new
    @transaction = Transaction.new
    if current_user
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
      Notifier.send_transaction_email(current_user).deliver
      flash[:notice] = "Successfully created your order!"
      redirect_to transaction_path(@transaction)
    else
      flash[:notice] = "There was a problem creating your order!"
      render :new
    end
  end

  def show
    @transaction = Transaction.find_by(id: params[:id])
    if current_user.id = @transaction.order.user_id
      render :show
    else
      @transaction = nil
      redirect_to root_path
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:first_name, :last_name, :credit_card_number, :credit_card_expiration, :zipcode)
  end

end

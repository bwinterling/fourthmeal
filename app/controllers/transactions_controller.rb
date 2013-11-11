class TransactionsController < ApplicationController

  def index
    @transaction = Transaction.all
  end
  def new
    @transaction = Transaction.new
    if current_user
      render :new
    else
      redirect_to new_session_path
    end
  end

  def create
    transaction = Transaction.create(transaction_params)
    if transaction.save
      current_order.transaction = transaction
      # transaction.order.status = "Paid"
      flash[:notice] = "Successfully created your order!"
      redirect_to transaction_path(transaction)
    else
      flash[:notice] = "There was a problem creating your order!"
      redirect_to new_transaction_path
    end
  end

  def show
    @transaction = Transaction.find_by(id: params[:id])
  end

  private

  def transaction_params
    params.require(:transaction).permit(:first_name, :last_name, :credit_card_number, :credit_card_expiration, :zipcode)
  end


end

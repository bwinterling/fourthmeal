class TransactionsController < ApplicationController

  def index
    @transaction = Transaction.all
  end
  def new
    @transaction = Transaction.new
  end

  def create
    transaction = Transaction.create(transaction_params)
    if transaction.save
      current_order.transaction = transaction
      redirect_to transaction_path(transaction)
    else
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

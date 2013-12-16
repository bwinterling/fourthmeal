class CompletePurchase

  def initialize(user, order, mailer=OrderMailer)
    @user = user
    @order = order
    @mailer = mailer
  end

  def create(params, success, failure)
    ActiveRecord::Base.transaction do
      transaction = @order.build_transaction(params)
      if transaction.save
        transaction_successfully_saved(transaction)
        success.call(transaction)
      else
        failure.call
      end
    end
  end

  def transaction_successfully_saved(trans)
    trans.pay!
    @order.update(:user_id => @user.id) if @user
    @mailer.order_confirmation(trans).deliver
  end

end

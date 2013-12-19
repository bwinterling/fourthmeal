class CompletePurchase

  def initialize(user, order, restaurant, mailer=OrderMailer)
    @user = user
    @order = order
    @restaurant = restaurant
    @mailer = mailer
  end

  def create(params, success, failure)
    ActiveRecord::Base.transaction do
      transaction = Transaction.new(params)
      if transaction.save
        transaction_successfully_saved(transaction)
        success.call(@restaurant, transaction)
      else
        failure.call
      end
    end
  end

  def transaction_successfully_saved(trans)
    @order.update(:user_id => @user.id) if @user
    @mailer.order_confirmation(trans).deliver
  end

end

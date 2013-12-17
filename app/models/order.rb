class Order < ActiveRecord::Base
  validates_numericality_of :user_id, :greater_than_or_equal_to => 0

  validates :user_id, presence: true

  has_many :order_items, inverse_of: :order
  has_many :items, through: :order_items
  has_many :transactions

  def status
    if transactions.any? { |t| t.result == "success" }
      "paid"
    else
      "unpaid"
    end
  end

end

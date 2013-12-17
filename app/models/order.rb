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

  def total
    total = 0
    order_items.each do |order_item|
      total += order_item.quantity * order_item.item.price
    end
    "Order Total: #{total}"
  end

  def add_item(item, quantity)
    self.order_items.create(:item_id => item.id,
    :quantity => quantity )
  end

end

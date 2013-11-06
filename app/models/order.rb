class Order < ActiveRecord::Base
  validates :status, presence: true, inclusion: { in: 
    ['ordered', 'completed', 'cancelled'] }
  validates_numericality_of :user_id, :greater_than => 0

  has_many :order_items, inverse_of: :order
  has_many :items, through: :order_items
end

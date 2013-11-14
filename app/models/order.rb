class Order < ActiveRecord::Base
  validates :status, presence: true, inclusion: { in: 
    ['unpaid', 'paid'] }
  validates_numericality_of :user_id, :greater_than_or_equal_to => 0

  validates :user_id, presence: true

  has_many :order_items, inverse_of: :order
  has_many :items, through: :order_items
  has_one  :transaction
end

class OrderItem < ActiveRecord::Base
  validates_numericality_of :order_id, :greater_than => 0
  validates_numericality_of :item_id, :greater_than => 0
  validates_numericality_of :quantity, :greater_than => 0

  belongs_to :order#, inverse_of: :order
  belongs_to :item#, inverse_of: :item
end

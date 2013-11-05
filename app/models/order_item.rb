class OrderItem < ActiveRecord::Base
  validates_numericality_of :order_id, :greater_than => 0
  validates_numericality_of :item_id, :greater_than => 0
end

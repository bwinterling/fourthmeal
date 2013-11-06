class ItemCategory < ActiveRecord::Base
  validates :item_id, presence: true
  validates :category_id, presence: true
  validates_numericality_of :item_id
  validates_numericality_of :category_id
  
  belongs_to :category
  belongs_to :item
end

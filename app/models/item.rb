class Item < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates_numericality_of :price, :greater_than => 0
  validates :photo, presence: true

  has_many :item_categories
  has_many :categories, through: :item_categories
end

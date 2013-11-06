class Item < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates_numericality_of :price, :greater_than => 0
  validates :photo, presence: true
  
  has_many :item_categories, inverse_of: :item
  has_many :categories, :through => :item_categories

  has_many :order_items, inverse_of: :item
  has_many :orders, :through => :order_items

  def self.filter_by_category(category)
    joins(:categories).where("categories.title"=> category)
  end

end

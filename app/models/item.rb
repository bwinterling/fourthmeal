class Item < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates_numericality_of :price, :greater_than => 0
  validates :photo, presence: true
  
  has_many :items_categories
  has_many :categories, :through => :items_categories

  def self.filter_by_category(category)
    joins(:categories).where("categories.title"=> category)
  end

end

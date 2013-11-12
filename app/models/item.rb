class Item < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates_numericality_of :price, :greater_than => 0
  validates :photo, presence: true
  
  has_many :item_categories
  has_many :categories, :through => :item_categories

  has_many :order_items
  has_many :orders, :through => :order_items

  has_attached_file :avatar, :styles => { :medium => "300X300", :thumb => "100x100"},
  :default_url => "/images/:style/missing.png"


  def self.filter_by_category(category)
    joins(:categories).where("categories.title"=> category)
  end

end

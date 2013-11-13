class Item < ActiveRecord::Base
    has_attached_file :photo,
    :default_url => "/images/:style/missing.png"
  # attr_accessor :photo_file_name

  validates :title, presence: true
  validates :description, presence: true
  validates_numericality_of :price, :greater_than => 0
  
  has_many :item_categories
  has_many :categories, :through => :item_categories

  has_many :order_items
  has_many :orders, :through => :order_items

  has_attached_file :photo,
    :default_url => "/images/:style/missing.png"


  def self.filter_by_category(category)
    joins(:categories).where("categories.title"=> category)
  end

end

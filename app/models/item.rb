class Item < ActiveRecord::Base
  # attr_accessor :photo_file_name

  validates :title, presence: true
  validates :description, presence: true
  validates_numericality_of :price, :greater_than_or_equal_to => 0

  
  has_many :item_categories
  has_many :categories, :through => :item_categories

  has_many :order_items
  has_many :orders, :through => :order_items

  has_attached_file :photo,
    :default_url => "/images/:style/missing.png"

  def self.filter_by_category(category)
    joins(:categories).where("categories.title"=> category)
  end

  def self.active
    where(:retired => false)
  end

end

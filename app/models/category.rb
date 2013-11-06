class Category < ActiveRecord::Base
  validates :title, presence: true

  has_many :item_categories
  has_many :items, through: :item_categories
end

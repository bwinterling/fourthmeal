class Category < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true

  has_many :item_categories
  has_many :items, through: :item_categories

  def to_param
    title.downcase.gsub(" ", "_")
  end

  def self.find_by_slug(target)
    all.detect{|c| c.to_param == target}
  end

end

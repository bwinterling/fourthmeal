class Restaurant < ActiveRecord::Base
  has_many :items
  before_validation :slugify

  validates :name,        presence: true, uniqueness: true
  validates :location,    presence: true
  validates :description, presence: true
  validates :slug,        presence: true, uniqueness: true

  def to_param
    slug
  end

  def slugify
    self.slug = self.name.parameterize
  end

end

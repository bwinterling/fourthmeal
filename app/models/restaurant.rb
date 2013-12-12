class Restaurant < ActiveRecord::Base
  has_many :items

  validates :name,        presence: true
  validates :location,    presence: true
  validates :description, presence: true

  def to_param
    name
  end

  def self.find_by_param(input)
    find_by(:name => input)
  end

end

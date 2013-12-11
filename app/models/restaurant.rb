class Restaurant < ActiveRecord::Base
  has_many :items

  validates :name,        presence: true
  validates :location,    presence: true
  validates :description, presence: true

end

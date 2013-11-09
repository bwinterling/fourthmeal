class Transaction < ActiveRecord::Base
  belongs_to :order

  validates_presence_of :first_name 
  validates_presence_of :last_name
  validates_presence_of :credit_card_number
  validates_presence_of :credit_card_expiration
  validates_presence_of :zipcode


end

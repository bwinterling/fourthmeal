class Transaction < ActiveRecord::Base
  belongs_to :order

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_format_of   :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates_format_of   :zipcode, with: /\d{5}/

  def pay!
    order.status = "paid"
    order.save
  end
end

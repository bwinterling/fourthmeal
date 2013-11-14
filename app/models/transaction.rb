class Transaction < ActiveRecord::Base
  belongs_to :order

  validates_presence_of :first_name 
  validates_presence_of :last_name
  validates_format_of   :credit_card_number, with: /\d{16}/
  validates_format_of   :credit_card_expiration, with: /\d{2}\/\d{2}/, :message => "Expiration Date should be entered as mm/yy "
  validates_format_of   :zipcode, with: /\d{5}/

  def pay!
    order.status = "paid"
    order.save
  end
end

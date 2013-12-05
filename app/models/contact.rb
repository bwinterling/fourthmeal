class Contact < ActiveRecord::Base

  validates_presence_of     :subject
  validates_presence_of     :comment
  validates_format_of       :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

end

# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
OnoBurrito::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => 'bennlewis',
  :password => ENV['SENDGRID_PD'],
  :domain => 'http://onoburrito.herokuapp.com/',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
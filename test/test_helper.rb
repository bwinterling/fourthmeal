ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails' 

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  def create_valid_item
    @item = Item.create(:title => "Hello!", 
    :description => "World", 
    :price => 4, 
    :photo => "photo.png")
  end

  def create_valid_order
    @order = Order.create(:status => 'ordered', :user_id => 5)
  end

  def create_valid_category
    @category = Category.create(:title => 'Brunch')
  end

  def create_valid_user
    @user = User.create(:email        => "ben@example.com",
                        :full_name    => "Bennny Smith",
                        :display_name => "Bennybeans")
  end

  # Add more helper methods to be used by all tests here...
end

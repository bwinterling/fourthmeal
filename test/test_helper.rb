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

  def create_item
    @item = Item.new
    @item.save
  end

  def create_valid_item
    @item = Item.create(
      :title => "Hello!", 
      :description => "World", 
      :price => 4, 
      :photo => "test.png")
  end

  # Add more helper methods to be used by all tests here...
end

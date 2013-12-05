ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require './test/helpers/minitest_helper'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  def create_valid_item
    @item = Item.create(:title => "Hello!",
    :description => "World",
    :price => 4,
    :slug => "new_item",
    :retired => false,
    :photo_file_name => "hello.jpg",
    :photo_content_type => "jpeg",
    :photo_file_size => 12353,
    :photo_updated_at => Time.now.to_s)
  end

  def create_valid_order
    @order = Order.create(:status => 'unpaid', :user_id => 5)
  end

  def create_valid_category
    @category = Category.create(:title => 'Brunch')
  end

  def create_valid_user(password = "password")
    @user = User.create(:email        => "test@example.com",
                        :full_name    => "Bennny Smith",
                        :display_name => "Bennybeans",
                        :password     => password)
  end

  def create_and_login_user
    user = create_valid_user
    visit log_in_path
    click_on "Log In"

    within "#login-form" do
      fill_in "Email", with: user.email
      fill_in "Password", with: "password"
      click_button "Log In"
    end
  end

  # Add more helper methods to be used by all tests here...
end

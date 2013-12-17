ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require './test/helpers/minitest_helper'


class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
  self.use_transactional_fixtures = false

  def create_valid_item(restaurant_id=1, title="Hello!")
    @item = Item.create(:title => title,
    :description => "World",
    :price => 4,
    :slug => "new_item",
    :retired => false,
    :photo_file_name => "hello.jpg",
    :photo_content_type => "jpeg",
    :photo_file_size => 12353,
    :photo_updated_at => Time.now.to_s,
    :restaurant_id => restaurant_id)
  end

  def create_valid_order
    @order = Order.create(:user_id => 5)
  end

  def create_valid_category
    @category = Category.find_or_create_by(:title => 'Brunch')
  end

  def create_valid_user(password="password", email="test@example.com")
    @user = User.where(:email => email).first_or_create(
                        :email        => email,
                        :full_name    => "Bennny Smith",
                        :display_name => "Bennybeans",
                        :password     => password,
                        :password_confirmation => password)
  end

  def last_email
    ActionMailer::Base.deliveries.last
  end

  def reset_email
    ActionMailer::Base.deliveries = []
  end

  def create_and_login_user
    user = create_valid_user("password","foo@bar.com")
    visit log_in_path

    within "#login-form" do
      fill_in "Email", with: "foo@bar.com"
      fill_in "Password", with: "password"
      click_button "Log In"
    end
    user
  end

  def create_transaction_for(user)
    Transaction.create(first_name: user.full_name,
                       last_name: user.display_name,
                       email: user.email,
                       zipcode: "12345",
                       order_id: user.orders.last.id,
                       result: "success"
                      )
  end

end

require "test_helper"

class UsersTest < ActiveSupport::TestCase

  test "it_validates_its_attributes" do
    @user = User.new
    @user.save
    assert @user.invalid?
  end

  test "it_invalid_email" do
    @user = User.create(:email => "Smith@example.com")
    assert @user.invalid?
  end

 
  test "it_validates_full_name" do
    @user = User.create(:full_name => "George Branson")
    assert @user.invalid?
  end

  test "it_validates_display_name" do 
    @user = User.create(:display_name => "Hashrocket")
    assert @user.invalid?
  end 
 
end

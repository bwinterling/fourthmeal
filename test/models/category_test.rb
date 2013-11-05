require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  test "it_validates_its_attributes" do
    category = Category.new
    category.save

    assert category.invalid?
    category.errors.full_messages.inspect 
  end

end

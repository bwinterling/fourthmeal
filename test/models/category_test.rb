require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  test "it is created with valid attributes" do
    create_valid_category
    assert @category.valid?
  end

  test "it_validates_its_attributes" do
    category = Category.new
    category.save

    assert category.invalid?
    category.errors.full_messages.inspect
  end

  test "it has items" do
    create_valid_category
    assert @category.items
  end

  test "it can find by slug" do
    Category.create("title" => "Entrees")
    test_cat = Category.find_by_slug("entrees")
    assert_equal "Entrees", test_cat.title
  end

end

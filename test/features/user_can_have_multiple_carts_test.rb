require './test/test_helper'
require_relative '../helpers/restaurant_helper'

class UserCanHaveMultipleCartsTest < Capybara::Rails::TestCase

  def test_user_can_have_multiple_carts
    #create two restaurants
    #create items for each
    #visit first rest, and add itme to cart
    #assert order displays rest name
    #visit rest #2 haha I said #2
    #assert rest cart empty
    #add item
    #assert cart only has current rest item
    #vist rest 1
    #assert has first item only
  end






end
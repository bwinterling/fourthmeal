require_relative "../test_helper"

class RestaurantsControllerTest < ActionController::TestCase

  before do
    @restaurant = Restaurant.create(valid_params)
    @user = create_valid_user
  end

  def valid_params
    {
      name: "Billy's",
      location: "NYC",
      description: "Awesome food"
    }
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:restaurants)
  end

  def test_show
    get :show, id: @restaurant
    assert_response :success
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_new_not_acessible_to_non_admin
    get :new, { }, { "current_user" => @user }
    assert_redirected_to restaurants_path
  end
  # TODO: write similar tests for create, edit, update, destroy

  def test_create
    assert_difference('Restaurant.count') do
      post :create, restaurant: valid_params
    end

    assert_redirected_to restaurant_path(assigns(:restaurant))
  end

  def test_create_not_acessible_to_non_admin
    skip
    assert_difference('Restaurant.count') do
      post :create, { restaurant: valid_params }, { "current_user" => @user }
    end
    assert_redirected_to restaurants_path
  end

  def test_edit
    get :edit, id: @restaurant
    assert_response :success
  end

  def test_update
    put :update, id: @restaurant, restaurant: valid_params
    assert_redirected_to restaurant_path(assigns(:restaurant))
  end

  def test_destroy
    assert_difference('Restaurant.count', -1) do
      delete :destroy, id: @restaurant
    end

    assert_redirected_to restaurants_path
  end
end

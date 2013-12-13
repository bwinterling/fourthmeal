class ActiveSupport::TestCase

  def create_valid_restaurant(params={})
    Restaurant.create!(valid_params.merge(params))
  end

  def valid_params
    {
      name: "Billy's",
      location: "NYC",
      description: "Awesome food"
    }
  end

end

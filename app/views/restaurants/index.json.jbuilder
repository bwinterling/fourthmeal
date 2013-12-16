json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :name, :location, :description
  json.url restaurant_url(restaurant, format: :json)
end

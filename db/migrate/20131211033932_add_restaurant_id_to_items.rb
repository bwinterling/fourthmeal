class AddRestaurantIdToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :restaurant_id, :integer
  end

  def self.down
    drop_column :items, restaurant_id
  end
end

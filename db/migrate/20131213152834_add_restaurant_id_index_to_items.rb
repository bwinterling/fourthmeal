class AddRestaurantIdIndexToItems < ActiveRecord::Migration
  def self.up
    add_index :items, :restaurant_id
  end

  def self.down
    remove_index :items, :restaurant_id
  end
end

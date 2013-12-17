class AddIndexToRestaurantSlug < ActiveRecord::Migration
  def self.up
    add_index :restaurants, :slug
  end

  def self.down
    remove_index :restaurants, :slug
  end
end

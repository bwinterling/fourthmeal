class AddNameIndexToRestaurants < ActiveRecord::Migration
  def self.up
    add_index :restaurants, :name
  end

  def self.down
    remove_index :restaurants, :name
  end
end

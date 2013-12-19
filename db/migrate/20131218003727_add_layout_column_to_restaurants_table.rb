class AddLayoutColumnToRestaurantsTable < ActiveRecord::Migration
  def self.up
    add_column :restaurants, :layout, :string
  end

  def self.down
    drop_column :restaurants, :layout
  end
end

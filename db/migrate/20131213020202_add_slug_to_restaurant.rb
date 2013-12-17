class AddSlugToRestaurant < ActiveRecord::Migration
  def self.up
    add_column :restaurants, :slug, :string
  end

  def self.down
    drop_column :restaurants, :slug
  end
end

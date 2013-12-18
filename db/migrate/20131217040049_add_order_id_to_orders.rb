class AddOrderIdToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :restaurant_id, :integer
  end

  def self.down
    remove_column :orders, :restaurant_id
  end
end

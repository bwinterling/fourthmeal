class AddIndexToUserIdOnOrders < ActiveRecord::Migration
  def self.up
    add_index :orders, :user_id
  end

  def self.down
    remove_index :orders, :user_id
  end
end

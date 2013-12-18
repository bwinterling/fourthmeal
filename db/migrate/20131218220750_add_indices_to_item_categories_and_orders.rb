class AddIndicesToItemCategoriesAndOrders < ActiveRecord::Migration
  def self.up
    add_index :item_categories, :item_id
    add_index :orders, :restaurant_id
  end

  def self.down
    remove_index :item_categories, :item_id
    remove_index :orders, :restaurant_id
  end
end

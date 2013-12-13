class AddIndicesToOrderItems < ActiveRecord::Migration
  disable_ddl_transaction!

  def self.up
    add_index :order_items, :order_id, algorithm: :concurrently
    add_index :order_items, :item_id,  algorithm: :concurrently
  end

  def self.down
    remove_index :order_items, :order_id
    remove_index :order_items, :item_id
  end
end

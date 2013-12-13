class AddIndexToEmailOnUsers < ActiveRecord::Migration
  disable_ddl_transaction!

  def self.up
    add_index :users, :email, algorithm: :concurrently
  end

  def self.down
    remove_index :users, :email
  end
end

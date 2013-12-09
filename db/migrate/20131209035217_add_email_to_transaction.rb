class AddEmailToTransaction < ActiveRecord::Migration
  def self.up
    add_column :transactions, :email, :string
  end

  def self.down
    drop_column :transactions, :email
  end
end

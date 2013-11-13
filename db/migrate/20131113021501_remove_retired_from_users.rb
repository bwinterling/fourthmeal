class RemoveRetiredFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :retired
  end
end

class FixUsersAndAddSlugAndRetiredToItemsInstead < ActiveRecord::Migration
  def change
    remove_column :users, :slug, :retired
    change_table :items do |t|
      t.string :slug
      t.boolean :retired
    end

  end
end

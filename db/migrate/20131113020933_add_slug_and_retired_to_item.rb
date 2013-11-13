class AddSlugAndRetiredToItem < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :slug
      t.boolean :retired
    end
  end
end

class Replacephotocolumnsonitems < ActiveRecord::Migration
  def change
    remove_column :items, :photo

    add_attachment :items, :photo
  end
end

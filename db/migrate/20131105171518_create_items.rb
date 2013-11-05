class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :title
      t.string :description
      t.decimal :price
      t.string :photo

      t.timestamps
    end
  end
end

class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :title
      t.string :description
      t.decimal :price, :precision => 10, :scale => 2
      t.string :photo

      t.timestamps
    end
  end
end

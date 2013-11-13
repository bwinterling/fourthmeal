class AddFalseByDefaultToRetiredOnItems < ActiveRecord::Migration
  def up    
    change_column :items, :retired, :boolean, :default => false
    Item.where(:retired => nil).each do |item|
      item.retired = false
      item.save
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration.new("Sorry, bro.")
  end
end

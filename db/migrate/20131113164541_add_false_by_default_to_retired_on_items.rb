class AddFalseByDefaultToRetiredOnItems < ActiveRecord::Migration
  def change
    change_column :items, :retired, :boolean, :default => false

    Item.all.each do |item|
      if item.retired.nil?
        item.retired = false
        item.save
      end
    end
    
  end
end

class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :first_name
      t.string :last_name
      t.string :credit_card_number
      t.string :credit_card_expiration
      t.string :zipcode
      t.references :order

      t.timestamps
    end
  end
end

class AddResultColumnToTransactionsTable < ActiveRecord::Migration
  def change
    add_column :transactions, :result, :string
  end
end

class ChangeAmountColumnTypeInTransactionDetails < ActiveRecord::Migration[7.1]
  def change
    change_column :transaction_details, :amount, :float
  end
end

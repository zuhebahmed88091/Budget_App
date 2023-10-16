class RenameUserIdColumnTransactionDetail < ActiveRecord::Migration[7.1]
  def change
    rename_column :transaction_details, :user_id, :author_id
  end
end

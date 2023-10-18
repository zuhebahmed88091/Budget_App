class ChangeAmountColumnTypeInCategories < ActiveRecord::Migration[7.1]
  def change
    change_column :categories, :amount, :float
  end
end

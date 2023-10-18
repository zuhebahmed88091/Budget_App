class CreateCategoryDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :category_details do |t|
      t.references :categories, foreign_key: true
      t.references :transaction_details, foreign_key: true

      t.timestamps
    end
  end
end

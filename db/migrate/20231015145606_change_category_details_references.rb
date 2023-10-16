class ChangeCategoryDetailsReferences < ActiveRecord::Migration[7.1]
  def change
    change_table :category_details do |t|
      t.remove_references :categories, foreign_key: true
      t.remove_references :transaction_details, foreign_key: true
      t.references :category, foreign_key: true, index: true
      t.references :transaction_detail, foreign_key: true, index: true
    end
  end
end

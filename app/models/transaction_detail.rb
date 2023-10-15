class TransactionDetail < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  has_many :category_details, dependent: :destroy
  has_many :categories, through: :category_details
end

class TransactionDetail < ApplicationRecord
  belongs_to :user
  has_many :category_details
  has_many :categories, through: :category_details
end

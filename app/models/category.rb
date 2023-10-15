class Category < ApplicationRecord
    belongs_to :user
    has_many :category_details, dependent: :destroy
    has_many :transaction_details, through: :category_details
end
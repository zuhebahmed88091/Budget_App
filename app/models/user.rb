class User < ApplicationRecord
  has_many :transaction_details, dependent: :destroy, foreign_key: 'author_id'
  has_many :categories, dependent: :destroy
end

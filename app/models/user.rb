class User < ApplicationRecord
    has_many :transaction_details, dependent: :destroy
    has_many :categories, dependent: :destroy
end

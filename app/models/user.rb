class User < ApplicationRecord
    has_many :transactionDetails
    has_many :categories
end

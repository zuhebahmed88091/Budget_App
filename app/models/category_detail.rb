class CategoryDetail < ApplicationRecord
    belongs_to :category
    belongs_to :transaction_detail
end

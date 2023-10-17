class TransactionDetail < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  has_many :category_details, dependent: :destroy
  has_many :categories, through: :category_details

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :user, presence: true
end

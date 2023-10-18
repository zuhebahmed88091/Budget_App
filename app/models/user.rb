class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :transaction_details, dependent: :destroy, foreign_key: 'author_id'
  has_many :categories, dependent: :destroy

  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }
end

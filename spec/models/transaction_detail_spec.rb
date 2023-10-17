require 'rails_helper'

RSpec.describe TransactionDetail, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
        user = User.create(username: 'Darth Vader', email: 'darth@example.com', password: 'password')
        category = Category.create(name: 'Category 1', user: user)
        transaction_detail = TransactionDetail.new(name: 'Sample Item', user: user, amount: 100.0)
        transaction_detail.category_details.build(category: category)
  
        expect(transaction_detail).to be_valid
    end

    it 'is not valid without a user' do
      category = Category.create(name: 'Category 1', user: nil)
      transaction_detail = TransactionDetail.new(name: 'Sample Item', user: nil, amount: 100.0)
      transaction_detail.category_details.build(category: category)

      expect(transaction_detail).to_not be_valid
    end

    it 'is not valid without name' do
      user = User.create(username: 'Darth Vader', email: 'darth@example.com', password: 'password')
      category = Category.create(name: 'Category 1', user:)
      transaction_detail = TransactionDetail.new(name: nil, user: user, amount: 100.0)
      transaction_detail.category_details.build(category: category)

      expect(transaction_detail).to_not be_valid
    end

    it 'is not valid with a negative amount' do
      user = User.create(username: 'Darth Vader', email: 'darth@example.com', password: 'password')
      category = Category.create(name: 'Category 1', user:)
      transaction_detail = TransactionDetail.new(name: 'Sample Item', user: user, amount: -100.0)
      transaction_detail.category_details.build(category: category)

      expect(transaction_detail).to_not be_valid
    end
  end

  describe 'associations' do
    it 'belongs to an user' do
      association = TransactionDetail.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end
  end
end
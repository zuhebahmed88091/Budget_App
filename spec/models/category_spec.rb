require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      user = User.create(username: 'Darth Vader', email: 'darth@example.com', password: 'password')
      category = Category.new(
        user:,
        name: 'Sample Category',
        icon: 'category-icon.png',
        amount: 250.0
      )

      expect(category).to be_valid
    end

    it 'is not valid without a user' do
      category = Category.new(
        name: 'Sample Category',
        icon: 'category-icon.png',
        amount: 250.0
      )

      expect(category).to_not be_valid
    end

    it 'is not valid without a name' do
      user = User.create(username: 'Darth Vader', email: 'darth@example.com', password: 'password')
      category = Category.new(
        user:,
        icon: 'category-icon.png',
        amount: 250.0
      )

      expect(category).to_not be_valid
    end

    it 'is not valid without an icon' do
      user = User.create(username: 'Darth Vader', email: 'darth@example.com', password: 'password')
      category = Category.new(
        user:,
        name: 'Sample Category',
        amount: 250.0
      )

      expect(category).not_to be_valid
    end

    it 'is valid without an amount' do
      user = User.create(username: 'Darth Vader', email: 'darth@example.com', password: 'password')
      category = Category.new(
        user:,
        name: 'Sample Category',
        icon: 'category-icon.png'
      )

      expect(category).to be_valid
    end
  end

  describe 'associations' do
    it 'belongs to a user' do
      association = Category.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end
  end
end

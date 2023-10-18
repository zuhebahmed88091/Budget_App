require 'rails_helper'

RSpec.describe 'TransactionDetails', type: :feature do
  before(:each) do
    DatabaseCleaner.clean
  end

  before(:each) do
    @user = FactoryBot.create(:user)
    @category = FactoryBot.create(:category, user: @user)
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: 'password123'
    click_button 'Log in'
    sleep(1)
  end

  it 'allows a user to create a transaction detail' do
    visit new_category_transaction_detail_path(@category)
    fill_in 'Name', with: 'Transaction for Rent'
    fill_in 'Amount', with: 100
    select 'Groceries', from: 'Category'
    sleep(1)
    within('form') do
      click_button 'Create Transaction'
    end
    sleep(1)
    expect(page).to have_text('Transaction for Rent')
    expect(page).to have_text('$100.0')
    expect(page).to have_text('Groceries')
  end

  it 'allows a user to see TOTAL AMOUNT' do
    visit new_category_transaction_detail_path(@category)
    fill_in 'Name', with: 'Transaction for Rent'
    fill_in 'Amount', with: 100
    select 'Groceries', from: 'Category'
    sleep(1)
    within('form') do
      click_button 'Create Transaction'
    end
    sleep(1)
    expect(page).to have_text('TOTAL AMOUNT')
    expect(page).to have_text('$100.00')
  end

  it 'allows a user to see Most recent' do
    visit new_category_transaction_detail_path(@category)
    fill_in 'Name', with: 'Transaction for Rent'
    fill_in 'Amount', with: 100
    select 'Groceries', from: 'Category'
    sleep(1)
    within('form') do
      click_button 'Create Transaction'
    end
    sleep(1)
    expect(page).to have_text('Most recent')
  end

  it 'allows a user to see Gift credit' do
    visit new_category_transaction_detail_path(@category)
    fill_in 'Name', with: 'Transaction for Rent'
    fill_in 'Amount', with: 100
    select 'Groceries', from: 'Category'
    sleep(1)
    within('form') do
      click_button 'Create Transaction'
    end
    sleep(1)
    expect(page).to have_text('Most ancient')
    expect(page).to have_text('Gift credit')
    expect(page).to have_text('$00.0')
  end
end

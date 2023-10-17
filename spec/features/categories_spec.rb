require 'rails_helper'

RSpec.describe 'Categories', type: :feature do
    before(:each) do
        DatabaseCleaner.clean
    end
    
    before(:each) do
        user = FactoryBot.create(:user)
        visit new_user_session_path
        fill_in 'Email', with: user.email
        fill_in 'Password', with: 'password123'
        click_button 'Log in'
        sleep(1)
    end

    it 'allows a user to create a category' do
        visit new_category_path

        fill_in 'Name', with: 'Rent'
        select 'Rent', from: 'Icon'
        within('form') do
            click_button 'Create Category'
        end
        sleep(5)
        expect(page).to have_text('Rent')
        expect(page).to have_text('$0.0')
    end

    it 'allows a user to see Most recent' do
        visit categories_path
        sleep(1)
        expect(page).to have_text('Most recent')
    end

    it 'allows a user to see Most ancient' do
        visit categories_path
        sleep(1)
        expect(page).to have_text('Most ancient')
    end

    it 'allows a user to see Gift credit' do
        visit categories_path
        sleep(1)
        expect(page).to have_text('Gift credit')
        expect(page).to have_text('$00.0')
    end
end
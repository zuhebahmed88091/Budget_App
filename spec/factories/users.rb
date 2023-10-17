FactoryBot.define do
    factory :user do
      username { 'Darth Vader' }
      email { 'darth@example.com' }
      password { 'password123' }
      password_confirmation { 'password123' }
    end
end
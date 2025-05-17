FactoryBot.define do
  factory :user do
    name { "Test User" }
    sequence(:email) { |n| "testuser#{n}@example.com" }
    password { "password" }
  end
end

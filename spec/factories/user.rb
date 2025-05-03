FactoryBot.define do
  factory :user do
    name { "Test User" }
    email { "testuser@example.com" }
    password { "password" }
  end
end

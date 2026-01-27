FactoryBot.define do
  factory :event do
    title { "Test Event" }
    description { "Test Description" }
    start_at { Time.current }
    end_at { Time.current + 1.hour }
    association :created_by, factory: :user
    association :location
  end
end

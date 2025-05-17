FactoryBot.define do
  factory :rating do
    user
    song
    rating { rand(1..5) }
  end
end

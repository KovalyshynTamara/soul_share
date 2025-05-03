FactoryBot.define do
  factory :song do
    title { "Test Song" }
    author { "Test Author" }
    genre { "Pop" }
    lyrics { "Test Lyrics" }
    added_by { association :user }
  end
end

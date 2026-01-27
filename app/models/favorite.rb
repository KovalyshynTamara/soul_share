class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :song

  validates :song_id, uniqueness: { scope: :user_id, message: "You have already favorited this song" }
end

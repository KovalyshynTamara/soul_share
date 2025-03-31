class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :song
  validates :user_id, presence: true
  validates :song_id, presence: true
  validates_uniqueness_of :song_id, scope: :user_id, message: "You have already favorited this song"
end

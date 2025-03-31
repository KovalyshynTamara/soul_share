class Rating < ApplicationRecord
  belongs_to :user, optional: false
  belongs_to :song, optional: false
  validates :user_id, presence: true
  validates :song_id, presence: true
  validates :rating, presence: true, inclusion: { in: 1..5, message: "must be between 1 and 5" }
end

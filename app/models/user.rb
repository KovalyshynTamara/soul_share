class User < ApplicationRecord
  has_many :songs, foreign_key: "added_by_id"
  has_many :events, foreign_key: :created_by
  has_many :favorites
  has_many :ratings
  has_many :event_participants
  has_many :comments, through: :event_participants
end

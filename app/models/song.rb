class Song < ApplicationRecord
  belongs_to :added_by, class_name: "User", foreign_key: "added_by_id"
  has_many :event_songs
  has_many :events, through: :event_songs
  has_many :favorites
  has_many :ratings
end

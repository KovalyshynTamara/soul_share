class EventParticipant < ApplicationRecord
  belongs_to :event
  belongs_to :user
  has_many :event_songs
  has_many :comments
  has_many :event_songs, dependent: :destroy
  has_many :comments, dependent: :destroy
end

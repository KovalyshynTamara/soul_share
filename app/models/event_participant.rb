class EventParticipant < ApplicationRecord
  belongs_to :event
  belongs_to :user
  has_many :event_songs
  has_many :comments
end

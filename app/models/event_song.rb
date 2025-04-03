class EventSong < ApplicationRecord
  belongs_to :event
  belongs_to :song
  belongs_to :event_participant, optional: true
  delegate :user, to: :event_participant, allow_nil: true

  validates :event_id, presence: true
  validates :song_id, presence: true
end

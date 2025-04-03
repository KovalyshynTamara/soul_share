class EventParticipant < ApplicationRecord
  belongs_to :event
  belongs_to :user
  has_many :event_songs
  has_many :comments

  validates :event_id, presence: true
  validates :user_id, presence: true
end

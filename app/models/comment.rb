class Comment < ApplicationRecord
  belongs_to :event
  belongs_to :event_participant
  has_one :user, through: :event_participant

  validates :content, presence:  true
  # validates :event_participant_id, presence: true
end

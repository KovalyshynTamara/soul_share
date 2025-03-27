class Comment < ApplicationRecord
  belongs_to :event
  belongs_to :event_participant
  has_one :user, through: :event_participant
end

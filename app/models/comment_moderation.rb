class CommentModeration < ApplicationRecord
  belongs_to :comment
  belongs_to :moderator, class_name: "EventParticipant"

  validates :comment_id, presence: true
  validates :moderator_id, presence: true
end

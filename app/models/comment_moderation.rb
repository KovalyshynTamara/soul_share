class CommentModeration < ApplicationRecord
  belongs_to :comment
  belongs_to :moderator, class_name: 'EventParticipant'
end

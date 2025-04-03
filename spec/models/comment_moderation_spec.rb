require 'rails_helper'

RSpec.describe CommentModeration, type: :model do
  it { is_expected.to belong_to(:comment) }
  it { is_expected.to belong_to(:moderator).class_name('EventParticipant') }

  it { is_expected.to validate_presence_of(:comment_id) }
  it { is_expected.to validate_presence_of(:moderator_id) }
end

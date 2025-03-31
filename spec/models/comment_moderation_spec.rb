require 'rails_helper'

RSpec.describe CommentModeration, type: :model do
  it { should belong_to(:comment) }
  it { should belong_to(:moderator).class_name('EventParticipant') }
  it { should validate_presence_of(:comment_id) }
  it { should validate_presence_of(:moderator_id) }
end

require 'rails_helper'

RSpec.describe CommentModeration, type: :model do
  it { should belong_to(:comment) }
  it { should belong_to(:moderator).class_name('EventParticipant') }
end

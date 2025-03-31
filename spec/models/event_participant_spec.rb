require 'rails_helper'

RSpec.describe EventParticipant, type: :model do
  it { should belong_to(:event) }
  it { should belong_to(:user) }
  it { should have_many(:event_songs) }
  it { should have_many(:comments) }
  it { should validate_presence_of(:event_id) }
  it { should validate_presence_of(:user_id) }
end

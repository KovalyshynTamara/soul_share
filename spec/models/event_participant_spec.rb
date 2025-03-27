require 'rails_helper'

RSpec.describe EventParticipant, type: :model do
  it { should belong_to(:event) }
  it { should belong_to(:user) }
  it { should have_many(:event_songs) }
  it { should have_many(:comments) }
end

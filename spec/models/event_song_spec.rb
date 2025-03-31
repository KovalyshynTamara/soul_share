require 'rails_helper'

RSpec.describe EventSong, type: :model do
  it { should belong_to(:event) }
  it { should belong_to(:song) }
  it { should belong_to(:event_participant).optional }
  it { should validate_presence_of(:event_id) }
  it { should validate_presence_of(:song_id) }
end

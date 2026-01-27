require 'rails_helper'

RSpec.describe EventSong, type: :model do
  it { is_expected.to belong_to(:event) }
  it { is_expected.to belong_to(:song) }
  it { is_expected.to belong_to(:event_participant).optional }

  it { is_expected.to validate_presence_of(:event_id) }
  it { is_expected.to validate_presence_of(:song_id) }
end

require 'rails_helper'

RSpec.describe Rating, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:song) }

  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_presence_of(:song_id) }
  it { is_expected.to validate_presence_of(:rating) }
  it { is_expected.to validate_inclusion_of(:rating).in_range(1..5).with_message("must be between 1 and 5") }
end

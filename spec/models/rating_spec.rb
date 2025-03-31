require 'rails_helper'

RSpec.describe Rating, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:song) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:song_id) }
  it { should validate_presence_of(:rating) }
  it { should validate_inclusion_of(:rating).in_range(1..5).with_message("must be between 1 and 5") }
end

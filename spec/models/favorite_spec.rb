require 'rails_helper'

RSpec.describe Favorite, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:song) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:song_id) }
end

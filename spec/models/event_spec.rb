require 'rails_helper'

RSpec.describe Event, type: :model do
  it { is_expected.to belong_to(:created_by).class_name('User') }
  it { is_expected.to belong_to(:location).optional }
  it { is_expected.to have_many(:event_participants) }
  it { is_expected.to have_many(:event_songs) }
  it { is_expected.to have_many(:songs).through(:event_songs) }
  it { is_expected.to have_many(:comments) }

  it { is_expected.to validate_presence_of(:created_by) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_length_of(:title).is_at_least(3).is_at_most(100) }
end

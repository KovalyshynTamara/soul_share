require 'rails_helper'

RSpec.describe Event, type: :model do
  it { should belong_to(:created_by).class_name('User') }
  it { should belong_to(:location).optional }
  it { should have_many(:event_participants) }
  it { should have_many(:event_songs) }
  it { should have_many(:songs).through(:event_songs) }
  it { should have_many(:comments) }

  it { should validate_presence_of(:created_by) }
  it { should validate_presence_of(:title) }
  it { should validate_length_of(:title).is_at_least(3).is_at_most(100) }
end

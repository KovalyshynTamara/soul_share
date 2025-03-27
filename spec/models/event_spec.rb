require 'rails_helper'

RSpec.describe Event, type: :model do
  it { should belong_to(:created_by).class_name('User').required(true) }
  it { should belong_to(:location).optional }
  it { should have_many(:event_participants) }
  it { should have_many(:event_songs) }
  it { should have_many(:songs).through(:event_songs) }
  it { should have_many(:comments) }
end

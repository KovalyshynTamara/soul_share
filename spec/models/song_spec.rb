require 'rails_helper'

RSpec.describe Song, type: :model do
  it { should belong_to(:added_by).class_name('User') }
  it { should have_many(:event_songs) }
  it { should have_many(:events).through(:event_songs) }
  it { should have_many(:favorites) }
  it { should have_many(:ratings) }
  it { should validate_presence_of(:title) }
  it { should validate_length_of(:title).is_at_most(255) }
  it { should validate_presence_of(:author) }
  it { should validate_length_of(:author).is_at_most(255) }
end

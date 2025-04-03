require 'rails_helper'

RSpec.describe Song, type: :model do
  it { is_expected.to belong_to(:added_by).class_name('User') }
  it { is_expected.to have_many(:event_songs) }
  it { is_expected.to have_many(:events).through(:event_songs) }
  it { is_expected.to have_many(:favorites) }
  it { is_expected.to have_many(:ratings) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_length_of(:title).is_at_most(255) }
  it { is_expected.to validate_presence_of(:author) }
  it { is_expected.to validate_length_of(:author).is_at_most(255) }
end

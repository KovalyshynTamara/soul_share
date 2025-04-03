require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { is_expected.to belong_to(:event) }
  it { is_expected.to belong_to(:event_participant) }
  it { is_expected.to have_one(:user).through(:event_participant) }

  it { is_expected.to validate_presence_of(:event_id) }
  it { is_expected.to validate_presence_of(:event_participant_id) }
end

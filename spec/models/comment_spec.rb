require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should belong_to(:event) }
  it { should belong_to(:event_participant) }
  it { should have_one(:user).through(:event_participant) }
end

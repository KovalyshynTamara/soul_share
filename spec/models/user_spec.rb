require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:songs).with_foreign_key('added_by_id') }
  it { should have_many(:events).with_foreign_key('created_by') }
  it { should have_many(:favorites) }
  it { should have_many(:ratings) }
  it { should have_many(:event_participants) }
end

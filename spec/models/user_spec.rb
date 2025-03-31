require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:songs).with_foreign_key('added_by_id') }
  it { should have_many(:events).with_foreign_key('created_by_id') }
  it { should have_many(:favorites) }
  it { should have_many(:ratings) }
  it { should have_many(:event_participants) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it "validates email format" do
    user = User.new(name: "John", email: "invalid_email")
    expect(user).to_not be_valid

    user.email = "valid@example.com"
    expect(user).to be_valid
  end
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_length_of(:name).is_at_least(3).is_at_most(20) }
end

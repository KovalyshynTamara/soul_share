require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:songs).with_foreign_key('added_by_id') }
  it { is_expected.to have_many(:events).with_foreign_key('created_by_id') }
  it { is_expected.to have_many(:favorites) }
  it { is_expected.to have_many(:ratings) }
  it { is_expected.to have_many(:event_participants) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  describe "email validation" do
    let(:user) { User.new(name: "John") }

    it "is invalid with an incorrect email format" do
      allow(user).to receive(:email).and_return("invalid_email")
      expect(user).to_not be_valid
    end

    it "is valid with a correct email format" do
      allow(user).to receive(:email).and_return("valid@example.com")
      expect(user).to be_valid
    end
  end
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_least(3).is_at_most(20) }
end

require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get home_index_path

      expect(response).to be_successful
    end
  end
end

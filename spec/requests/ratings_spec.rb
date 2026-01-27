require 'rails_helper'

RSpec.describe "Ratings", type: :request do
  let!(:user) { create(:user) }
  let!(:song) { create(:song) }

  before do
    login_as(user, scope: :user)
  end

  describe "POST /songs/:song_id/ratings" do
    context "when no rating exists yet" do
      it "creates a new rating" do
        expect {
          post song_ratings_path(song), params: { rating: 4 }
        }.to change(Rating, :count).by(1)

        rating = Rating.last
        expect(rating.user).to eq(user)
        expect(rating.song).to eq(song)
        expect(rating.rating).to eq(4)
      end
    end

    context "when a rating already exists" do
      let!(:existing_rating) { create(:rating, user: user, song: song, rating: 2) }

      it "updates the rating instead of creating a new one" do
        expect {
          post song_ratings_path(song), params: { rating: 5 }
        }.not_to change(Rating, :count)

        existing_rating.reload
        expect(existing_rating.rating).to eq(5)
      end
    end

    context "response format" do
      it "responds with turbo stream when requested" do
        post song_ratings_path(song), params: { rating: 3 }, headers: { "Accept" => "text/vnd.turbo-stream.html" }
        expect(response.media_type).to eq("text/vnd.turbo-stream.html")
        expect(response).to have_http_status(:ok)
      end

      it "redirects in HTML fallback" do
        post song_ratings_path(song), params: { rating: 4 }
        expect(response).to redirect_to(song_path(song))
      end
    end
  end

  describe "unauthenticated user" do
    before do
      logout(:user)
    end

    it "redirects to login page" do
      post song_ratings_path(song), params: { rating: 4 }
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end

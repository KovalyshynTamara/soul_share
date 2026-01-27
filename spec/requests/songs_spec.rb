require 'rails_helper'

RSpec.describe "Songs", type: :request do
  let(:user) { create(:user) }

  before do
    Warden.test_mode!
    login_as(user, scope: :user)
  end

  after do
    Warden.test_reset!
  end

  describe "GET /songs" do
    it "returns http success" do
      get songs_path
      expect(response).to be_successful
    end
  end

  describe "GET /songs/new" do
    it "returns http success" do
      get new_song_path
      expect(response).to be_successful
    end
  end

  describe "POST /songs" do
    context "with valid parameters" do
      it "creates a new song and redirects to songs path" do
        expect {
          post songs_path, params: { song: { title: "Test Song", author: "Test Author", genre: "Pop", lyrics: "Test Lyrics" } }
        }.to change(Song, :count).by(1)
        expect(response).to redirect_to(songs_path)
        follow_redirect!
        expect(response.body).to include("Song created successfully!")
      end
    end

    context "with invalid parameters" do
      it "does not create a new song and re-renders the new template" do
        expect {
          post songs_path, params: { song: { title: "", author: "Test Author", genre: "Pop", lyrics: "Test Lyrics" } }
        }.to_not change(Song, :count)
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include("errors")
      end
    end
  end

  describe "GET /songs/:id" do
    let!(:song) { create(:song, title: "Test Song", author: "Test Author", genre: "Pop", lyrics: "Test Lyrics", added_by: user) }

    it "returns http success" do
      get song_path(song)
      expect(response).to be_successful
    end
  end

  describe "GET /songs/:id/edit" do
    let!(:song) { create(:song, title: "Test Song", author: "Test Author", genre: "Pop", lyrics: "Test Lyrics", added_by: user) }

    it "returns http success" do
      get edit_song_path(song)
      expect(response).to be_successful
    end
  end

  describe "PATCH /songs/:id" do
    let!(:song) { create(:song, title: "Test Song", author: "Test Author", genre: "Pop", lyrics: "Test Lyrics", added_by: user) }

    context "with valid parameters" do
      it "updates the song and redirects to the song page" do
        patch song_path(song), params: { song: { title: "Updated Song", author: "Updated Author", genre: "Rock", lyrics: "Updated Lyrics" } }
        song.reload
        expect(song.title).to eq("Updated Song")
        expect(response).to redirect_to(song_path(song))
      end
    end

    context "with invalid parameters" do
      it "does not update the song and re-renders the edit template" do
        patch song_path(song), params: { song: { title: "", author: "Updated Author", genre: "Rock", lyrics: "Updated Lyrics" } }
        song.reload
        expect(song.title).to eq("Test Song")
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /songs/:id" do
    let!(:song) { create(:song, title: "Test Song", author: "Test Author", genre: "Pop", lyrics: "Test Lyrics", added_by: user) }

    it "deletes the song and redirects to songs path" do
      expect {
        delete song_path(song)
      }.to change(Song, :count).by(-1)
      expect(response).to redirect_to(songs_path)
      follow_redirect!
      expect(response.body).to include("Song deleted successfully!")
    end
  end
end

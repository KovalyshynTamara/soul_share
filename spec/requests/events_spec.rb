require 'rails_helper'

RSpec.describe 'Events', type: :request do
  let!(:user) { create(:user) }
  let!(:event) { create(:event, title: 'Test Event', description: 'Test Description', start_at: Time.now, end_at: Time.now + 1.hour, location_id: create(:location).id, created_by: user) }

  before do
    login_as(user, scope: :user)
  end

  describe "GET /events" do
    it "returns http success" do
      get events_path
      expect(response).to be_successful
    end
  end

  describe "GET /events/:id" do
    it "returns http success" do
      get event_path(event)
      expect(response).to be_successful
    end
  end

  describe "GET /events/new" do
    it "returns http success" do
      get new_event_path
      expect(response).to be_successful
    end
  end

  describe "POST /events" do
    context "with valid parameters" do
      it "creates a new event and redirects to the event page" do
        expect {
          post events_path, params: { event: { title: 'New Event', description: 'New Description', location_id: create(:location).id, start_at: Time.now, end_at: Time.now + 1.hour } }
        }.to change(Event, :count).by(1)
        expect(response).to redirect_to(event_path(Event.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new event and renders the new template" do
        expect {
          post events_path, params: { event: { title: '', description: 'Invalid Event', location_id: nil, start_at: nil, end_at: nil } }
        }.to_not change(Event, :count)
        expect(response).to render_template(:new)
        expect(response.status).to eq(422)
      end
    end
  end

  describe "GET /events/:id/edit" do
    it "returns http success" do
      get edit_event_path(event)
      expect(response).to be_successful
    end
  end

  describe "PATCH /events/:id" do
    context "with valid parameters" do
      it "updates the event and redirects to the event page" do
        patch event_path(event), params: { event: { title: 'Updated Event', description: 'Updated Description' } }
        event.reload
        expect(event.title).to eq('Updated Event')
        expect(event.description).to eq('Updated Description')
        expect(response).to redirect_to(event_path(event))
      end
    end

    context "with invalid parameters" do
      it "does not update the event and renders the edit template" do
        patch event_path(event), params: { event: { title: '', description: 'Invalid Description' } }
        event.reload
        expect(event.title).not_to eq('')
        expect(event.description).not_to eq('Invalid Description')
        expect(response).to render_template(:edit)
        expect(response.status).to eq(422)
      end
    end
  end

  describe "DELETE /events/:id" do
    it "deletes the event and redirects to the events path" do
      expect {
        delete event_path(event)
      }.to change(Event, :count).by(-1)
      expect(response).to redirect_to(events_path)
    end
  end
end

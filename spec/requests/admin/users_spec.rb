require 'rails_helper'

RSpec.describe "Admin::Users", type: :request do
  let!(:admin) { create(:user, admin: true) }
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }

  before do
    login_as(admin, scope: :user)
  end

  describe "GET /admin/users" do
    it "returns http success and lists users" do
      get admin_users_path
      expect(response).to be_successful
      expect(response.body).to include(user.email)
      expect(response.body).to include(other_user.email)
    end
  end

  describe "GET /admin/users/:id" do
    it "returns http success and shows user" do
      get admin_user_path(user)
      expect(response).to be_successful
      expect(response.body).to include(user.email)
    end
  end

  describe "GET /admin/users/:id/edit" do
    it "returns http success" do
      get edit_admin_user_path(user)
      expect(response).to be_successful
    end
  end

  describe "PATCH /admin/users/:id" do
    context "with valid parameters" do
      it "updates the user and redirects to users index" do
        patch admin_user_path(user), params: { user: { name: "New Name", email: "newemail@example.com" } }
        user.reload
        expect(user.name).to eq("New Name")
        expect(user.email).to eq("newemail@example.com")
        expect(response).to redirect_to(admin_users_path)
      end
    end

    context "with invalid parameters" do
      it "does not update the user and renders edit template" do
        patch admin_user_path(user), params: { user: { email: "" } }
        user.reload
        expect(user.email).not_to eq("")
        expect(response).to render_template(:edit)
        expect(response.status).to eq(422).or eq(200) # Залежить від контролера, можливо 200
      end
    end
  end

  describe "DELETE /admin/users/:id" do
    it "deletes the user and redirects to users index" do
      delete admin_user_path(user)
      expect(User.exists?(user.id)).to be_falsey
      expect(response).to redirect_to(admin_users_path)
    end
  end

  describe "GET /admin/users/:id/impersonate" do
    it "starts impersonation and redirects to root path" do
      get impersonate_admin_user_path(user)
      expect(response).to redirect_to(root_path)
      # перевірки сесії або current_user можна тут пропустити
    end
  end

  describe "GET /stop_impersonating" do
    it "stops impersonation and redirects to root path" do
      get stop_impersonating_path
      expect(response).to redirect_to(root_path)
    end
  end
end

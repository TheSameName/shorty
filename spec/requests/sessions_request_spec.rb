RSpec.describe "Sessions" do

  describe "GET /login" do
    it "returns http success" do
      get sign_in_path

      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /login" do
    let!(:account) { create(:account) }

    context "with valid credentials" do
      it "redirects to home page" do
        expect do
          post sign_in_path, params: { email: account.email, password: account.password }
        end.to change(Session, :count).by(1)

        expect(response).to redirect_to(home_path)
      end
    end

    context "with invalid credentials" do
      it "renders the login page" do
        expect do
          post sign_in_path, params: { email: account.email, password: "wrong_password" }
        end.not_to change(Session, :count)

        expect(response).to redirect_to sign_in_path(email_hint: account.email)
      end
    end
  end

  describe "DELETE /logout" do
    let!(:account) { create(:account) }

    before { sign_in account }

    it "redirects to login page" do
      expect do
        delete session_path Current.session
        account.reload
      end.to change(account.sessions, :count).by(-1)

      expect(response).to redirect_to(sessions_path)
      expect(flash[:notice]).to eq("That session has been logged out")
    end
  end
end

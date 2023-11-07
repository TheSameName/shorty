RSpec.describe "Registrations" do

  describe "GET #new" do
    it "returns a successful response" do
      get sign_up_path

      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      let(:password) { Faker::Internet.password(min_length: 12) }
      let(:valid_params) do
        {
          email: "test@example.com",
          password:,
          password_confirmation: password
        }
      end

      it "creates a new account" do
        expect do
          post sign_up_path, params: valid_params
        end.to change(Account, :count).by(1)
      end

      it "creates a new session" do
        expect do
          post sign_up_path, params: valid_params
        end.to change(Session, :count).by(1)
      end

      it "sends an email verification" do
        expect do
          post sign_up_path, params: valid_params
        end.to have_enqueued_mail(AccountMailer, :email_verification)
      end

      it "redirects to the home page with a success message" do
        post sign_up_path, params: valid_params

        expect(response).to redirect_to(home_path)
        expect(flash[:notice]).to eq("Welcome! You have signed up successfully")
      end
    end

    context "with invalid params" do
      let(:invalid_params) do
        {
          email: "test@example.com",
          password: "password",
          password_confirmation: "wrong_password"
        }
      end

      it "does not create a new account" do
        expect do
          post sign_up_path, params: invalid_params
        end.not_to change(Account, :count)
      end

      it "does not create a new session" do
        expect do
          post sign_up_path, params: invalid_params
        end.not_to change(Session, :count)
      end

      it "does not send an email verification" do
        expect do
          post sign_up_path, params: invalid_params
        end.not_to have_enqueued_mail(AccountMailer, :email_verification)
      end

      it "renders the new template with an error status" do
        post sign_up_path, params: invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end

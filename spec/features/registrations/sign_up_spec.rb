RSpec.describe "Sign Up" do
  let(:password) { Faker::Internet.password(min_length: 12) }

  context "when signing up with valid credentials" do
    before "visit page and fill form" do
      visit sign_up_path

      fill_in "Email", with: "test@example.com"
      fill_in "Password", with: password
      fill_in "Password confirmation", with: password

      click_button "Sign up"
    end

    it "redirects to home page" do
      expect(page).to have_current_path(home_path)
    end

    it "displays success message" do
      expect(page).to have_text("Welcome! You have signed up successfully")
    end
  end

  context "when user fails to sign up" do
    before do
      visit sign_up_path
    end

    context "when using an invalid email" do
      before do
        fill_in "Email", with: "invalid-email"
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "password"

        click_button "Sign up"
      end

      it { expect(page).to have_current_path(sign_up_path) }

      it "displays error message for invalid email" do
        expect(page).to have_text("Email is invalid")
      end
    end

    context "when using a weak password" do
      before do
        fill_in "Email", with: Faker::Internet.email
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "password"

        click_button "Sign up"
      end

      it { expect(page).to have_current_path(sign_up_path) }

      it "displays error message for weak password" do
        expect(page).to have_text("Password might easily be guessed")
      end

      it "displays error message for password lenght" do
        expect(page).to have_text("8 characters minimum")
      end
    end
  end
end

RSpec.describe "Sign In" do
  let(:password) { Faker::Internet.password(min_length: 12) }
  let(:account) { create(:account, password:) }

  it "User signs in with valid credentials" do
    visit sign_in_path

    fill_in "Email", with: account.email
    fill_in "Password", with: password

    click_button "Sign in"

    expect(page).to have_current_path(home_path)
    expect(page).to have_text("Signed in successfully")
  end

  it "User signs in with invalid credentials" do
    visit sign_in_path

    fill_in "Email", with: account.email
    fill_in "Password", with: "wrong-password"

    click_button "Sign in"

    expect(page).to have_current_path sign_in_path(email_hint: account.email)
    expect(page).to have_text("That email or password is incorrect")
  end
end

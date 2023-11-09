RSpec.describe Account do
  subject(:account) { build(:account) }

  describe "associations" do
    it { is_expected.to have_many(:sessions).dependent(:destroy) }
  end

  describe "validations" do
    it { is_expected.to validate_length_of(:password).is_at_least(8) }

    describe "email" do
      subject(:account) { create(:account) }

      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.to validate_uniqueness_of(:email).case_insensitive }

      it { is_expected.to allow_value("user@example.com").for(:email) }
      it { is_expected.not_to allow_value("invalid").for(:email) }
      # TODO: Enhance email validation
      xit { is_expected.not_to allow_value("invalid@email").for(:email) }
      it { is_expected.not_to allow_value("invalid@@email").for(:email) }
      it { is_expected.not_to allow_value("userexample.com").for(:email) }
    end
  end

  describe "callbacks" do
    subject(:account) { create(:account) }

    describe "before_validation" do
      context "when email is changed" do
        before { account.update(email: "new_email@example.com") }

        it "sets verified to false" do
          expect(account.verified).to be(false)
        end
      end

      context "when email is not changed" do
        before { account.update(password: "new_password") }

        it "does not set verified to false" do
          expect(account.verified).to be(true)
        end
      end
    end

    describe "after_update" do
      context "when password_digest is changed" do
        let!(:current_session) { create(:session, account:) }
        let(:old_session) { create(:session, account:) }

        before do
          allow(Current).to receive(:session).and_return current_session
          account.update(password: "new_password")
        end

        it "deletes all sessions except the current one" do
          expect(account.sessions).to eq([Current.session])
        end
      end

      context "when password_digest is not changed" do
        let!(:current_session) { create(:session, account:) }
        let!(:old_session) { create(:session, account:) }

        before do
          allow(Current).to receive(:session)
            .and_return create(:session, account:)

          account.update(email: "new_email@example.com")
        end

        it "does not delete any sessions" do
          expect(account.sessions).to eq([current_session, old_session, Current.session])
        end
      end
    end
  end
end

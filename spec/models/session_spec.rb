RSpec.describe Session do
  subject(:session) { build(:session) }

  describe "associations" do
    it { is_expected.to belong_to(:account) }
  end

  describe "callbacks" do
    describe "before_create" do
      let(:current_user_agent) { Faker::Internet.user_agent }
      let(:current_ip_address) { Faker::Internet.ip_v4_address }

      before do
        allow(Current).to receive_messages(user_agent: current_user_agent, ip_address: current_ip_address)

        session.save
      end

      it { expect(session.user_agent).to eq(current_user_agent) }
      it { expect(session.ip_address).to eq(current_ip_address) }
    end
  end
end

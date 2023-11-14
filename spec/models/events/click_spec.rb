RSpec.describe Events::Click do

  it_behaves_like Event, :events_click

  describe "associations" do
    subject(:click) { build(:events_click) }

    it do
      expect(click)
        .to belong_to(:link)
        .class_name("Link")
        .inverse_of(:clicks)
        .counter_cache(true)
    end
  end

  describe "validations"

  describe "json attributes" do
    it { is_expected.to define_json_attribute(:remote_ip) }
    it { is_expected.to define_json_attribute(:user_agent) }
    it { is_expected.to define_json_attribute(:referer) }
    it { is_expected.to define_json_attribute(:utm_source) }
  end
end

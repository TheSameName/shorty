require "rails_helper"

RSpec.describe Link, type: :model do
  describe "relations" do
    it { should have_many(:link_configurations).dependent(:destroy) }
    it { should accept_nested_attributes_for(:link_configurations).allow_destroy(true) }
  end

  describe "validations" do
    it { should validate_presence_of(:url) }

    context "url format" do
      it { should allow_value("http://example.com").for(:url) }
      it { should allow_value("https://example.com").for(:url) }
      it { should_not allow_value("invalid_url").for(:url) }
    end
  end

  describe "#short_url" do
    it "returns the short URL" do
      link = create(:link)
      expect(link.short_url).to eq(Rails.application.routes.url_helpers.short_url(link.slug))
    end
  end

  describe "#generate_slug" do
    it "generates a slug after create" do
      link = build(:link, slug: nil)
      link.save
      expect(link.slug).not_to be_nil
    end
  end
end

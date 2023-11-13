require "rails_helper"

RSpec.describe Link do
  describe "relations" do
    it { is_expected.to have_many(:link_configurations).dependent(:destroy) }
    it { is_expected.to accept_nested_attributes_for(:link_configurations).allow_destroy(true) }

    it { is_expected.to have_many(:clicks).class_name("Events::Click").dependent(:destroy).inverse_of(:link).counter_cache(true) }
  end


  describe "validations" do
    it { is_expected.to validate_presence_of(:url) }

    context "url format" do
      it { is_expected.to allow_value("http://example.com").for(:url) }
      it { is_expected.to allow_value("https://example.com").for(:url) }
      it { is_expected.not_to allow_value("invalid_url").for(:url) }
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

      expect(link.slug).to eq(Base62.encode(link.id))
    end
  end
end

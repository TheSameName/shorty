require "test_helper"

class LinkTest < ActiveSupport::TestCase
  context "relations" do
    should have_many(:link_configurations).dependent(:destroy)
    should accept_nested_attributes_for(:link_configurations).allow_destroy(true)
  end

  context "validations" do
    should validate_presence_of(:url)

    context "url format" do
      should allow_value("http://example.com").for(:url)
      should allow_value("https://example.com").for(:url)
      should_not allow_value("invalid_url").for(:url)
    end
  end

  test "should encode id to base62 slug" do
    link = create(:link)

    assert_not_nil link.slug
    assert_equal link.slug, Base62.encode(link.id)
  end

  test "Link#short_url" do
    link = create(:link)

    assert_equal Rails.application.routes.url_helpers.short_url(link.slug), link.short_url
  end
end

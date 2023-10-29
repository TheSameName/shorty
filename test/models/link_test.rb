require "test_helper"

class LinkTest < ActiveSupport::TestCase
  test "should generate slug after create" do
    link = Link.create(url: "https://www.example.com")
    assert_not_nil link.slug
  end

  test "should encode id to base62 slug" do
    link = Link.create(url: "https://www.example.com")
    assert_equal link.slug, Base62.encode(link.id)
  end

  test "should not save link without url" do
    link = Link.new
    assert_not link.save
  end

  test "should not save link with invalid url format" do
    link = Link.new(url: "invalid_url")
    assert_not link.save
  end

  test "should return short url" do
    link = Link.create(url: "https://www.example.com")
    assert_equal Rails.application.routes.url_helpers.short_url(link.slug), link.short_url
  end

  test "should not return short url if slug is nil" do
    link = Link.create(url: "https://www.example.com")
    link.update(slug: nil)
    assert_nil link.short_url
  end

  test "should not generate slug if it already exists" do
    link1 = Link.create(url: "https://www.example.com")
    link2 = Link.create(url: "https://www.example.com")
    assert_not_equal link1.slug, link2.slug
  end
end

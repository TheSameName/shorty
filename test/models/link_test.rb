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
end

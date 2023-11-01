require "test_helper"

class LinkWithoutConfigurationTest < ActionDispatch::IntegrationTest
  attr_reader :link, :config

  setup do
    @link = create(:link)
  end

  test "should render default meta tags" do
    get short_path(slug: link.slug)

    assert_response :success
    assert_select "title", "Shorty"
    assert_select "meta[name='title'][content='Shorty~']", 1
    assert_select "meta[name='description'][content='Your custom url shortener!']", 1

    assert_select "meta[itemprop='name'][content='Shorty~']", 1
    assert_select "meta[itemprop='description'][content='Your custom url shortener!']", 1
    # assert_select "meta[itemprop='image'][content='#{image_path("/backgrounds/default-white.png")}']", 1

    assert_select "meta[property='og:type'][content='website']", 1
    assert_select "meta[property='og:url'][content='#']", 1
    assert_select "meta[property='og:title'][content='Shorty~']", 1
    assert_select "meta[property='og:description'][content='Your custom url shortener!']", 1
    # assert_select "meta[property='og:image'][content='#{image_path("/backgrounds/default-white.png")}']", 1

    assert_select "meta[property='twitter:card'][content='summary_large_image']", 1
    assert_select "meta[property='twitter:url'][content='#']", 1
    assert_select "meta[property='twitter:title'][content='Shorty~']", 1
    assert_select "meta[property='twitter:description'][content='Your custom url shortener!']", 1
    # assert_select "meta[property='twitter:image'][content='#{image_path("/backgrounds/default-white.png")}']", 1

    assert_select "meta[name='robots'][content='noindex, nofollow']", 1
    assert_select "meta[http-equiv='refresh'][content='1; url=#{link.url}']", 1
    # TODO: Understand how to test hhtp-equiv="refresh" redirects
    # assert_redirected_to link.url
  end
end

require "test_helper"

class LinkWithConfigurationTest < ActionDispatch::IntegrationTest
  attr_reader :link, :config

  setup do
    @link = create(:link)
    @config = create(:link_configuration, link:)
  end

  test "should render meta tags" do
    get short_path(slug: link.slug)

    assert_response :success

    assert_select "meta[name='robots'][content='noindex, nofollow']", 1
    assert_select "meta[name='title'][content='#{config.title}']", 1
    assert_select "meta[name='description'][content='#{config.description}']", 1
    assert_select "meta[itemprop='name'][content='#{config.title}']", 1
    assert_select "meta[itemprop='description'][content='#{config.description}']", 1
    assert_select "meta[itemprop='image'][content='#{config.image}']", 1
    assert_select "meta[property='og:type'][content='website']", 1
    assert_select "meta[property='og:url'][content='#{link.url}']", 1
    assert_select "meta[property='og:title'][content='#{config.title}']", 1
    assert_select "meta[property='og:description'][content='#{config.description}']", 1
    assert_select "meta[property='og:image'][content='#{config.image}']", 1
    assert_select "meta[property='twitter:card'][content='summary_large_image']", 1
    assert_select "meta[property='twitter:url'][content='#{link.url}']", 1
    assert_select "meta[property='twitter:title'][content='#{config.title}']", 1
    assert_select "meta[property='twitter:description'][content='#{config.description}']", 1
    assert_select "meta[property='twitter:image'][content='#{config.image}']", 1

    assert_select "meta[http-equiv='refresh'][content='1; url=#{link.url}']", 1

    # TODO: Understand how to test hhtp-equiv="refresh" redirects
    # assert_redirected_to link.url
  end
end

require "test_helper"

class LinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @link = create(:link)
  end

  should "get index" do
    get links_url
    assert_response :success
  end

  should "get new" do
    get new_link_url
    assert_response :success
  end

  should "create link" do
    assert_difference("Link.count") do
      post links_url, params: { link: { url: @link.url } }
    end

    assert_redirected_to link_url(Link.last)
  end

  should "show link" do
    get link_url(@link)
    assert_response :success
  end

  should "get edit" do
    get edit_link_url(@link)
    assert_response :success
  end

  should "update link" do
    patch link_url(@link), params: { link: { url: @link.url } }
    assert_redirected_to link_url(@link)
  end

  should "destroy link" do
    assert_difference("Link.count", -1) do
      delete link_url(@link)
    end

    assert_redirected_to links_url
  end
end

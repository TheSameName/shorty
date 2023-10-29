require "test_helper"

class RedirectsControllerTest < ActionDispatch::IntegrationTest
  test "should redirect to the correct URL" do
    link = links(:one)

    get short_path(slug: link.slug)

    assert_redirected_to link.url
  end

  test "should return 404 for non-existent slug" do
    get short_path(slug: "non-existent-slug")

    assert_response :not_found
  end
end

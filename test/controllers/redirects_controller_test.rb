require "test_helper"

class RedirectsControllerTest < ActionDispatch::IntegrationTest
  test "should redirect to the correct URL" do
    link = create(:link)

    get short_path(slug: link.slug)

    assert_response :ok
  end

  test "should return 404 for non-existent slug" do
    get short_path(slug: "non-existent-slug")

    assert_response :not_found
  end
end

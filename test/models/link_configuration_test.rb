require "test_helper"

class LinkConfigurationTest < ActiveSupport::TestCase
  should belong_to(:link)
  should have_one_attached(:image)

  should validate_presence_of(:title)
  should validate_presence_of(:description)
  should validate_presence_of(:image)

  test "should not allow image with invalid content type" do
    link_configuration = LinkConfiguration.new(title: "Test Title", description: "Test Description")
    link_configuration.image.attach(io: Rails.root.join("test/support/assets/sample.txt").open, filename: "sample.txt", content_type: "text/plain")

    assert_not link_configuration.valid?
    assert_equal ["must be a JPEG, PNG or WEBP"], link_configuration.errors[:image]
  end

  test "should not allow image with size greater than 5MB" do
    link_configuration = LinkConfiguration.new(title: "Test Title", description: "Test Description")
    link_configuration.image.attach(io: Rails.root.join("test/support/assets/10mb.jpg").open, filename: "10mb.jpg", content_type: "image/jpeg")

    assert_not link_configuration.valid?
    assert_equal ["must be less than 5MB"], link_configuration.errors[:image]
  end
end

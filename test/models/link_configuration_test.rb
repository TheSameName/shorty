require "test_helper"

class LinkConfigurationTest < ActiveSupport::TestCase
  should belong_to(:link)

  should validate_presence_of(:title)
  should validate_presence_of(:description)
  should validate_presence_of(:image)

end

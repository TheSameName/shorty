require "test_helper"

class LinkConfigurationTest < ActiveSupport::TestCase
  should belong_to(:link)
end

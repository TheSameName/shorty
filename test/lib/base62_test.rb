require "test_helper"

class Base62Test < ActiveSupport::TestCase
  test "encode and decode" do
    assert_equal 0, Base62.decode(Base62.encode(0))
    assert_equal 1, Base62.decode(Base62.encode(1))
    assert_equal 10, Base62.decode(Base62.encode(10))
    assert_equal 123, Base62.decode(Base62.encode(123))
    assert_equal 123456789, Base62.decode(Base62.encode(123456789))
  end

  test "encode nil" do
    assert_equal "0", Base62.encode(nil)
  end

  test "decode empty string" do
    assert_equal 0, Base62.decode("")
  end
end

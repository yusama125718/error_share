require "test_helper"

class Master::MiddleTest < ActiveSupport::TestCase
  test "nameのバリデーションが動作すること" do
    middle = Master::Middle.new(name: nil)
    assert_not middle.valid?
  end
end

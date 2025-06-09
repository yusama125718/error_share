require "test_helper"

class Master::MiddleTest < ActiveSupport::TestCase
  test "nameが必須" do
    middle = Master::Middle.new(name: nil)
    assert_not middle.valid?
  end

  test "nameは一意" do
    middle = Master::Middle.new(name: "Rails")
    assert_not middle.valid?
  end

  test "保存できること" do
    middle = Master::Middle.new(name: "hoge")
    assert middle.save
  end
end

require "test_helper"

class MainControllerTest < ActionDispatch::IntegrationTest
  test "ルートにアクセスした際トップページを表示すること" do
    get root_path
    assert_template "main/index"
  end
end

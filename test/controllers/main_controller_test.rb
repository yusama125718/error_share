require "test_helper"

class MainControllerTest < ActionDispatch::IntegrationTest
  test "rootへのリクエストが成功すること" do
    get root_path
    assert_response :success
    assert_template "main/index"
  end
end

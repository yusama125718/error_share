require "test_helper"

class Master::MiddleControllerTest < ActionDispatch::IntegrationTest
  test "indexへのリクエストが成功すること" do
    get master_middle_index_path
    assert_response :success
    assert_template "master/middle/index"
  end
end

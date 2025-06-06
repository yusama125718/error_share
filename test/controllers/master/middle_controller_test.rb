require "test_helper"

class Master::MiddleControllerTest < ActionDispatch::IntegrationTest
  test "indexにアクセスした際indexを表示すること" do
    get master_middle_index_path
    assert_template "master/middle/index"
  end
  
end

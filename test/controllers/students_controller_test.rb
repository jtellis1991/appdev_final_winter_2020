require "test_helper"

class StudentsControllerTest < ActionDispatch::IntegrationTest
  
  test "should get new registration" do
    get signup_path
    assert_response :success
  end
  
  test "should get new session" do
    get login_path
    assert_response :success
  end
  
end

require "test_helper"

class StudentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do
    get login_path
    sign_in students(:josh)
    post login_path
  end
  
  
  test "should get new registration" do
    get signup_path
    assert_response :success
  end
  
  test "should get new session" do
    get login_path
    assert_response :success
  end
  
end

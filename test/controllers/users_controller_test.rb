require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do
    get login_path
    sign_in users(:josh)
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

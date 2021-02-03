require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  def setup
    @user = users(:josh)
  end
 
  test "login with invalid information" do
    get login_path
    assert_template 'devise/sessions/new'
    post login_path, params: { user: { email: "", password: "" } }
    assert_select 'p.alert-danger', "Invalid Email or password."
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
  
  test "login with valid information" do
    get login_path
    assert_template 'devise/sessions/new'
    # sign_in(@user)
    post login_path, params: { user: { email: @user.email, 
                                          password: "password" } }
    # assert_redirected_to dashboard_path
    # assert_not flash.empty?
    assert_select 'p.alert-danger'#, "Signed in successfully."
   
    # follow_redirect!
    assert_select 'p.alert-success', "Signed in succesfully."
 
    # assert_template 'users/show'
    # assert_select "a[href=?]", login_path, count: 0
    # assert_select "a[href=?]", logout_path
    # assert_select "a[href=?]", user_path(@user)
  end
end

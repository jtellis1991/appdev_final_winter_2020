require "test_helper"

class StudentsLoginTest < ActionDispatch::IntegrationTest

  test "login with invalid information" do
    get login_path
    assert_template 'devise/sessions/new'
    post login_path, params: { session: { email: "", password: "" } }
    # assert_template 'devsise/sessions/new'
    assert_not flash.empty?
    # get root_path
    # assert flash.empty?
  end

end

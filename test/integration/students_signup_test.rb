require "test_helper"

class StudentsSignupTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers


  test "invalid signup information" do
    get signup_path
    assert_no_difference 'Student.count' do 
      post students_path, params: { student: { email: "student@invalid",
                                               password:              "foo",
                                               password_confirmation: "bar" } }
     end 
    assert_template 'devise/registrations/new'
    assert_select 'div#error_explanation'
    assert_select 'div.alert-danger'
  end
  
  test "valid signup information" do
    get signup_path
    assert_difference 'Student.count', 1 do
      post students_path, params: { student: 
                                      { email: "student@example.com",
                                        password:              "password",
                                        password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'devise/registrations/new'
  end 
end

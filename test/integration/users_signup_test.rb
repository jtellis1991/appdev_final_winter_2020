require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers


  test "invalid signup information" do
    get signup_path
    assert_no_difference 'user.count' do 
      post users_path, params: { user: { email: "user@invalid",
                                               password:              "foo",
                                               password_confirmation: "bar" } }
     end 
    assert_template 'devise/registrations/new'
    assert_select 'div#error_explanation'
    assert_select 'div.alert-danger'
  end
  
  test "valid signup information" do
    get signup_path
    assert_difference 'user.count', 1 do
      post users_path, params: { user: 
                                      { email: "user@example.com",
                                        password:              "password",
                                        password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'devise/registrations/new'
  end 
end

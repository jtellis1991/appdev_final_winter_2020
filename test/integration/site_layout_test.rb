require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 3
    assert_select "a[href=?]", support_path, count: 1
    assert_select "a[href=?]", about_path, count: 1
    assert_select "a[href=?]", blog_path, count: 2
  end
  
end

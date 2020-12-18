require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @base_title = "SATsucceed"
  end
  
  test "should get root" do
    get root_path
    assert_response :success
    assert_select "title", "#{@base_title}"
  end
  
  test "should get support" do
    get support_path
    assert_response :success
    assert_select "title", "Support | #{@base_title}"
  end
  
  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end
  
  test "should get blog" do
    get blog_path
    assert_response :success
    assert_select "title", "Blog | #{@base_title}"
  end
  
end

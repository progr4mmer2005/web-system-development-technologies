require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  test "should get home" do
    get root_url
    assert_response :success
    assert_select "title", @base_title
    assert_select "h1", "Welcome to the Sample App"
  end

  test "should get help" do
    get help_url
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
    assert_select "h1", "Help"
  end

  test "should get about" do
    get about_url
    assert_response :success
    assert_select "title", "About | #{@base_title}"
    assert_select "h1", "About"
  end

  test "should get contact" do
    get contact_url
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
    assert_select "h1", "Contact"
  end

  test "home is available through the root route" do
    get "/static_pages/home"
    assert_response :not_found
  end

  test "pages are available through named routes" do
    assert_equal "/", root_path
    assert_equal "/help", help_path
    assert_equal "/about", about_path
    assert_equal "/contact", contact_path
    assert_equal "/signup", signup_path
  end

  test "old static_pages urls are gone" do
    get "/static_pages/help"
    assert_response :not_found
  end
end

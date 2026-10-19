require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  test "should get home" do
    get root_url
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
    assert_select "h1", "Sample App"
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
    assert_select "h1", "Help"
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", "About | #{@base_title}"
    assert_select "h1", "About"
  end

  test "should get contact" do
    get static_pages_contact_url
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
    assert_select "h1", "Contact"
  end

  test "home is available through the root route" do
    get "/static_pages/home"
    assert_response :not_found
  end
end

require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get signup_url
    assert_response :success
    assert_select "title", full_title("Sign up")
    assert_select "h1", "Sign up"
  end
end

require "test_helper"

class UsersHelperTest < ActionView::TestCase
  def setup
    @user = User.new(name: "Example User", email: "Example@RailsTutorial.org")
    @gravatar_id = Digest::MD5.hexdigest("example@railstutorial.org")
  end

  test "gravatar_for uses size 80 by default" do
    assert_dom_equal %(<img alt="Example User" class="gravatar" src="https://secure.gravatar.com/avatar/#{@gravatar_id}?s=80" />),
                     gravatar_for(@user)
  end

  test "gravatar_for accepts a size option" do
    assert_dom_equal %(<img alt="Example User" class="gravatar" src="https://secure.gravatar.com/avatar/#{@gravatar_id}?s=50" />),
                     gravatar_for(@user, size: 50)
  end
end

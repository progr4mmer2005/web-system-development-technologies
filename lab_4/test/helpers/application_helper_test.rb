require "test_helper"

class ApplicationHelperTest < ActionView::TestCase
  setup do
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  test "full title defaults to the base title" do
    assert_equal @base_title, full_title
  end

  test "full title has no separator for an empty page title" do
    assert_equal @base_title, full_title("")
  end

  test "full title includes the page name before the base title" do
    assert_equal "Help | #{@base_title}", full_title("Help")
  end

  test "layout renders a title containing an apostrophe without double escaping" do
    render inline: '<% provide(:title, "Help\'s on the way") %>', layout: "layouts/application"

    assert_select "title", "Help's on the way | #{@base_title}"
  end
end

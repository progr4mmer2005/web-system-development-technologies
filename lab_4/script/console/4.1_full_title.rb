module ApplicationHelper
  def full_title(page_title = "")
    base_title = "Ruby on Rails Tutorial Sample App"

    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end

puts helper.full_title
puts helper.full_title("Home")
puts helper.full_title("Help")
puts helper.full_title("About")
puts helper.full_title("Contact")
p helper.stylesheet_link_tag(:app, media: "all")

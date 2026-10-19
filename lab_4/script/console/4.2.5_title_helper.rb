def full_title(page_title = "")
  base_title = "Ruby on Rails Tutorial Sample App"

  if page_title.empty?
    base_title
  else
    page_title + " | " + base_title
  end
end

puts full_title
puts full_title("")
puts full_title("Help")
p full_title == "Ruby on Rails Tutorial Sample App"
p full_title("Help") == "Help | Ruby on Rails Tutorial Sample App"

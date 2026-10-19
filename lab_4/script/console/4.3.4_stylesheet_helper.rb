options = { media: "all", "data-turbolinks-track" => true }
p options
puts helper.stylesheet_link_tag(:app, media: "all", "data-turbolinks-track" => true)
puts helper.stylesheet_link_tag(:app, { media: "all", "data-turbolinks-track" => true })
puts helper.stylesheet_link_tag(:app, media: "all",
                                      "data-turbolinks-track" => true)
puts helper.stylesheet_link_tag(
  :app,
  media: "all",
  "data-turbolinks-track" => true
)
p({ :name => "Michael" } == { name: "Michael" })

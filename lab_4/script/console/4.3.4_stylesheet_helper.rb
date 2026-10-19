options = { media: "all" }
p options
puts helper.stylesheet_link_tag(:app, options)
puts helper.stylesheet_link_tag(:app, { media: "all" })
puts helper.stylesheet_link_tag(:app, media: "all")

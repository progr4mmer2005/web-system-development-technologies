Rails.application.config.dartsass.builds = { "custom.scss" => "custom.css" }
Rails.application.config.dartsass.build_options = [ "--style=compressed", "--no-source-map", "--quiet-deps", "--silence-deprecation=import,global-builtin,color-functions,mixed-decls,slash-div" ]

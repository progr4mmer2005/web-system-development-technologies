# bootstrap-sass is loaded without its Sprockets engine (the app uses Propshaft),
# so only its Sass sources are added to the load path of the Sass compiler.
bootstrap_stylesheets = Gem.loaded_specs.fetch("bootstrap-sass").full_gem_path
Rails.application.config.assets.paths << File.join(bootstrap_stylesheets, "assets", "stylesheets")

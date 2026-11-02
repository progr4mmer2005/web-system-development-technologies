bootstrap_stylesheets = Gem.loaded_specs.fetch("bootstrap-sass").full_gem_path
Rails.application.config.assets.paths << File.join(bootstrap_stylesheets, "assets", "stylesheets")

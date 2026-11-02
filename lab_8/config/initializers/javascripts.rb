jquery_rails = Gem.loaded_specs.fetch("jquery-rails").full_gem_path
bootstrap_sass = Gem.loaded_specs.fetch("bootstrap-sass").full_gem_path
Rails.application.config.assets.paths << File.join(jquery_rails, "vendor", "assets", "javascripts")
Rails.application.config.assets.paths << File.join(bootstrap_sass, "assets", "javascripts")

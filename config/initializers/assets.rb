# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( hover.css )

Rails.application.config.assets.precompile += %w( linkify.js )

Rails.application.config.assets.precompile += %w( twitter.js )

Rails.application.config.assets.precompile += %w( instagram.js )

Rails.application.config.assets.precompile += %w( pure-min.css )

Rails.application.config.assets.precompile += %w( grids-responsive-min.css )
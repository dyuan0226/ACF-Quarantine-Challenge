source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.7'


# These gems below are recommended by GitHub; idk what they do but I just added them
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
# gem 'rails', '5.2.3' - this was the original given by ProfH
gem 'rails'
gem "actionpack", ">= 5.2.4.3"
gem "activestorage", ">= 5.2.4.3"
gem "activesupport", ">= 5.2.4.3"
gem "actionview", ">= 5.2.4.2"
gem "websocket-extensions", ">= 0.1.5"
# gem "rack", ">= 2.2.3"
# Use Puma as the app server
# gem 'puma', '3.11' - this was the original given by ProfH
gem "puma", ">= 3.12.6"

# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Other gems
gem 'validates_timeliness', '4.0.2'
gem 'time_date_helpers', '0.0.4'
gem 'cancancan'
gem 'simple-password-gen'
gem 'best_in_place', '~> 3.0.1'
gem 'materialize-sass', '~> 1.0.0'
gem 'simple_form'
gem 'materialize-form', git: 'https://github.com/cmu-is-projects/materialize-form.git'
gem 'will_paginate'
gem 'jquery-rails', '4.3.1'
gem 'jquery-ui-rails', '6.0.1'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and webdrivers
  gem 'capybara'
  gem 'webdrivers'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'hirb'
  gem 'faker'
  gem 'populator'
  gem 'factory_bot_rails'
  gem 'simplecov'
  gem 'shoulda', '3.5.0'
  gem 'shoulda-matchers', '2.8.0'
  gem 'minitest-rails', '3.0.0'
  gem 'minitest-reporters', '1.1.19'
  gem 'rails-controller-testing'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'launchy'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  # gem 'spring'
  # gem 'spring-watcher-listen', '~> 2.0.0'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

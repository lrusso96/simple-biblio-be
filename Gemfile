# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.2'
# Use Puma as the app server
gem 'puma', '~> 4.3.3'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.7'

gem 'acts_as_votable'

# Verify Firebase tokens
gem 'firebase_id_token', '~> 2.3.2'

# Simple http
gem 'httparty'

gem 'jwt'
# JSON parsing and more
gem 'json'
gem 'nokogiri'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS)
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 4.0'
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '~> 1.4'
end

group :development do
  gem 'listen', '~> 3.2.1'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Gemfile
group :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails', '~> 5.1.1'
  gem 'faker'
  # codecov generation and upload
  gem 'simplecov', require: false
  gem 'shoulda-matchers', '~> 4.3.0'
end

group :production do
  gem 'pg'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

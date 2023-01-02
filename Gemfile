source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.4"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.4"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "listen", "~> 3.3"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development do
  gem "foreman", "~> 0.87"
end

group :development, :test do
  gem "faker"
  gem "factory_bot_rails"
  gem "database_cleaner"
  gem "rspec-rails", "~> 5.0.0"
end

group :test do
  gem "rspec-json_expectations"
  gem "shoulda-matchers", "~> 4.0"
end

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem "rack-cors"

gem "bootsnap", ">= 1.4.4", require: false

# gem "faker"

gem "bcrypt", "~> 3.1.7"
gem "jwt"

gem "active_model_serializers", "~> 0.10.12"

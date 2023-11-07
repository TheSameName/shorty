source "https://rubygems.org"

ruby "3.2.2"

# Use specific branch of Rails
gem "rails", github: "rails/rails", branch: "7-1-stable"

# The modern asset pipeline for Rails [https://github.com/rails/propshaft]
gem "propshaft"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"

# Manage secrets
gem "dotenv-rails", require: "dotenv/rails-now"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem "bcrypt", "~> 3.1.7"

# Use Rack::Ratelimit to rate limit requests [https://github.com/jeremy/rack-ratelimit]
gem "rack-ratelimit", group: :production

# Use Redis adapter to run additional authentication features
gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
gem "kredis"

# Use Pwned to check if a password has been found in any of the huge data breaches [https://github.com/philnash/pwned]
gem "pwned"

# Tailwind-it!
gem "tailwindcss-rails", "~> 2.0"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "image_processing", "~> 1.12"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[windows jruby]

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[mri windows]

  gem "rspec-rails", "~> 6.0"
  gem "shoulda-matchers", "~> 4.5"
  gem "factory_bot_rails", "~> 6.2"
  gem "faker", "~> 3.2"

  gem "rubocop", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-performance", require: false

  gem "rubocop-rspec", require: false
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara", "~> 3.3"
  gem "selenium-webdriver", "~> 4.14"
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

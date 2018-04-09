source 'https://rubygems.org'

gem 'rails', '~> 5.1.5'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'

gem 'pg', '0.18.4'
gem 'bootstrap', '~> 4.0.0'
gem 'jquery-rails'
gem 'simple_form'
gem 'rails-i18n', '~> 5.0.0'
gem 'devise'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 3.7'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'simplecov', :require => false
  gem 'guard-rspec', require: false
end

group :production do
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

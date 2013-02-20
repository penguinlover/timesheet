source 'https://rubygems.org'

gem 'rails', '3.2.6'
gem 'pg'
gem 'unicorn'

# data services
gem 'databasedotcom', :git => 'git://github.com/penguinlover/databasedotcom.git'
gem 'databasedotcom-rails', :git => 'git://github.com/penguinlover/databasedotcom-rails.git'

# authentication/authroization
gem 'omniauth-google-apps', '~> 0.0.2'
gem 'bcrypt-ruby', '~> 3.0.1'

# backbone/json
gem 'rails-backbone'
gem 'jquery-rails'
gem 'ejs'
gem 'rabl'
gem 'yajl-ruby'
gem 'backbone-support'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'bootstrap-sass'
  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'cucumber-rails', :require => false
end

group :test do
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'database_cleaner'  
end

group :production do
  gem 'newrelic_rpm'
  gem 'rack-mini-profiler'
end

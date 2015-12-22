source 'https://rubygems.org'
ruby "2.2.2"

group :production do
  gem 'unicorn-rails'
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.6'
gem 'pg', '~> 0.18.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
gem 'coffee-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer',  platforms: :ruby
gem "less-rails"

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'twitter-bootstrap-rails', '3.2.0'
gem 'jquery-datatables-rails', :git => 'https://github.com/rweng/jquery-datatables-rails'
gem 'font-awesome-rails'

gem 'figgy'
gem 'devise'
gem 'rolify'
gem 'best_in_place'
gem 'remotipart', '~> 1.2'
gem 'mail'
gem 'capistrano', '2.15.4'
gem 'bluepill'
gem 'airbrake'
gem 'lookup_by'
#gem 'sidekiq' #read more at http://railscasts.com/episodes/366-sidekiq
#email stylers, as mentioned by http://railscasts.com/episodes/312-sending-html-email
# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring

group :development, :test do
  gem 'faker'
  gem 'pry'
  gem 'spring'
end

group :test do
  gem 'rspec-rails'
  gem 'cucumber-rails', require: false
  gem 'selenium-webdriver'
  gem 'poltergeist'# not sure that we need both drivers
  gem 'database_cleaner'
  gem 'webmock'
  gem 'factory_girl_rails'
  gem 'rack_session_access'
end

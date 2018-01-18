source 'https://rubygems.org'
ruby '2.3.4'

group :production do
  gem 'unicorn-rails'
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '>= 5.1'
gem 'pg', '~> 0.18.1'
gem 'figgy'
gem 'listen' # idk why this is needed

# front end
gem 'webpacker'

gem 'sass-rails'
gem 'uglifier', '>= 1.3.0'
gem 'therubyracer',  platforms: :ruby

gem 'jquery-rails' # TODO: rm jquery
gem 'jquery-ui-rails'
gem 'twitter-bootstrap-rails', '>= 4'
gem 'jquery-datatables-rails', git: 'https://github.com/rweng/jquery-datatables-rails'
gem 'font-awesome-rails'
gem 'best_in_place'
gem 'remotipart'

gem 'devise'
gem 'rolify'

gem 'mail'
gem 'capistrano', '2.15.4'
gem 'bluepill'
gem 'airbrake'
gem 'lookup_by'
# gem 'sidekiq' #read more at http://railscasts.com/episodes/366-sidekiq
# email stylers, as mentioned by http://railscasts.com/episodes/312-sending-html-email
# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring

group :development, :test do
  gem 'faker'
  gem 'pry'
  gem 'pry-byebug'
  gem 'spring'
  gem 'rubocop', '~> 0.39.0', require: false
end

group :test do
  gem 'rspec-rails'
  gem 'cucumber-rails', require: false
  gem 'selenium-webdriver'
  gem 'poltergeist' # not sure that we need both drivers
  gem 'database_cleaner'
  gem 'webmock'
  gem 'factory_bot_rails'
  gem 'rack_session_access'
end

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
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer',  platforms: :ruby
gem "less-rails"
gem 'lookup_by'

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
#gem 'sidekiq' #read more at http://railscasts.com/episodes/366-sidekiq
#email stylers, as mentioned by http://railscasts.com/episodes/312-sending-html-email
# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
group :development, :test do
  gem 'pry'
  gem 'faker'
  gem 'spring'
end

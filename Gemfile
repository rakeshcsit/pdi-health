source 'http://rubygems.org'

ruby '2.3.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.9'
# Use sqlite3 as the database for Active Record
# gem 'sqlite'
# gem 'pg' 
group :production do
	gem 'pg', '>= 0.19.0.beta'
end

group :development, :test do
  gem 'sqlite3'
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
gem 'bootstrap-sass', '~> 3.2.0.0'
gem "font-awesome-rails"
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

gem 'rails_12factor'

# so I can use unions
gem 'active_record_union', '~> 1.1'

gem 'figaro', '~> 1.1', '>= 1.1.1'

# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 3.1.1'

gem 'devise', '~> 4.2'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

gem "select2-rails", '~> 3.5.7'

gem 'groupdate', '~> 3.2'
gem 'chartkick', '~> 1.4', '>= 1.4.1'

group :development do
  # better errors
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_21]

  gem 'quiet_assets'
  # Quiet Assets turns off the Rails asset pipeline log. This means that it suppresses messages in your development log such as:
  # Started GET "/assets/application.js" for 127.0.0.1 at 2015-01-28 13:35:34 +0300
  # Served asset /application.js - 304 Not Modified (8ms)

  # for the rails panel to work in chrome
  gem 'meta_request'

  # let's you use binding.pry
  gem 'pry', '~> 0.10.1'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Passenger as the app server
gem 'passenger'


# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
gem 'tzinfo-data'
gem 'bcrypt', :platform => :ruby
gem 'bcrypt-ruby', '>= 3.1.2', :platform => :ruby
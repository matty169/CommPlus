source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: s'rails/rails'
gem 'rails', '4.0.0'
gem 'bootstrap-sass', '~> 2.3.2.0'		# This is has not been set up nor has it been used.
gem 'faker'
gem 'devise'		# only simple setup. Need to add data validation in models too.
gem "cancan"		# only superficially in the views, not the controllers.
gem "jqcloud-rails"

# It is working but there is no imagemagic to transform the data. And no default picture.
gem "paperclip", :git => "git://github.com/thoughtbot/paperclip.git"


group :development do
# Use sqlite3 as the database for Active Record
gem 'sqlite3'			# Need to upgrade to psotgress.
gem 'annotate'
end

group :assets do
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
end
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

group :production do
	gem 'pg'
end
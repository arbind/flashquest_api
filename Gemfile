source 'https://rubygems.org'
gem 'rails', '4.0.0.rc1'
gem 'mongoid', github: 'mongoid/mongoid'
gem 'bson_ext'

gem 'sass-rails', '~> 4.0.0.rc1'
gem 'haml-rails', '~> 0.4'
gem 'coffee-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'

gem 'jquery-rails'
gem 'jbuilder', '~> 1.0.1'

gem 'newrelic_rpm' #Server Monitoring

group :production do
  gem 'thin'
end

group :doc do # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false 
end

gem 'debugger', group: [:development, :test]

gem 'rspec-rails', group: [:development, :test]
gem 'database_cleaner', group: :test

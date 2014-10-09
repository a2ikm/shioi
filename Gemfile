source 'https://rubygems.org'


gem 'rails', '4.1.6'
gem 'pg'
gem 'unicorn', require: false
gem 'hashie'

# views and assets
gem 'sass-rails', '~> 4.0.3'
gem 'slim-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'bootstrap-sass'
gem 'autoprefixer-rails'
gem 'bootstrap_form'

# authentication
gem 'omniauth'
gem 'omniauth-twitter'

group :development do
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'rails-erd'

  # pry
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'pry-stack_explorer'
  gem 'hirb-unicode'
  gem 'better_errors'
  gem 'binding_of_caller'

  # guard
  gem 'guard-rspec'
  gem 'guard-bundler'
end

group :development, :test do
  gem 'quiet_assets'
  gem 'tapp'
  gem 'rspec-rails'
end

group :test do
  gem 'rspec-its'
  gem 'webmock'
  gem 'rake_shared_context'
  gem 'database_rewinder'
  gem 'fabrication'
  gem 'ffaker'
end

group :doc do
  gem 'sdoc', '~> 0.4.0'
end


source 'https://rubygems.org'
ruby File.read(File.expand_path('../.ruby-version', __FILE__)).strip

gem 'rails', '4.1.6'
gem 'pg'
gem 'unicorn', require: false
gem 'feedjira'
gem 'hashie'
gem 'ffaker'

# views and assets
gem 'sass-rails', '~> 4.0.3'
gem 'slim-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'bootstrap-sass'
gem 'autoprefixer-rails'
gem 'bootstrap_form'

# pagination
gem 'kaminari'
gem 'bootstrap-kaminari-views'

# authentication
gem 'omniauth'
gem 'omniauth-twitter'

group :production do
  gem 'rails_12factor'
end

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
end

group :doc do
  gem 'sdoc', '~> 0.4.0'
end


source 'https://rubygems.org'

gem 'rails', '3.2.7'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
group :test, :development do
  gem 'sqlite3'
  gem "rspec-rails"
  gem 'minitest'
  gem 'rr'
  gem 'turn'
  gem 'activerecord-nulldb-adapter', :git => 'git://github.com/nulldb/nulldb.git'
  gem 'spork', '0.9.0'
  gem 'factory_girl_rails'
  #gem 'capybara'
  gem 'capybara-webkit'
  gem "shoulda-matchers"
  gem 'database_cleaner'
  gem 'cucumber-rails', :require => false
  gem 'jasminerice'
end



# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'heroku'
# Gemfile in Rails >= 3.1
gem 'activeadmin'
gem "meta_search",    '>= 1.1.0.pre'
gem 'client_side_validations'
gem 'casperjs'


group :production do
  gem 'pg', '0.12.2'
  gem 'thin'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

source 'https://rubygems.org'

gem 'rails', '~> 4.2.6'
gem 'haml'
gem 'nokogiri'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'rdiscount', '~> 1.6.8'
gem 'mini_magick', '~> 3.6.0'
gem 'whenever'
gem 'formtastic', '~>2.3.0'
gem 'paperclip'
gem 'mail'
gem 'i18n'
gem 'responders', '~> 2.0'
gem 'sqlite3', '~> 1.3.10'
gem 'therubyracer', platforms: :ruby
gem 'modernizr-rails'
gem 'ckeditor_rails'
gem 'aws-sdk', '~> 2'
gem 'browser'

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development, :test do
  gem 'rspec-rails'
  gem 'dotenv-rails'
  # for debugging
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'capistrano', '~> 2.14.2'
  gem 'capistrano-ext'
  gem 'capistrano-rbenv'
  gem 'simplecov', require: false
  gem 'rb-readline'

  # for checking images in specs
  gem 'fastimage'

  gem 'rubocop', '~> 0.34.0', require: false

  # catches email sending, and logs instead
  gem 'letter_opener'

  # scans code for silly mistakes
  gem 'brakeman'

  #reruns the specs on code change
  gem 'rerun'

  # factories
  gem 'factory_girl_rails'

  # For real looking data in tests
  gem 'faker'
end

group :staging, :production do
  gem 'unicorn'
end

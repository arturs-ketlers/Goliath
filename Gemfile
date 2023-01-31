source 'http://rubygems.org'
ruby File.read("#{File.dirname(__FILE__)}/.ruby-version").chomp
# git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.0'
gem 'rails-i18n', '~> 6.0'

# Use mysql2 as the database for Active Record
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
# Use Puma as the app server
gem 'puma', '~> 3.4'

# Use SCSS for stylesheets
gem 'sassc-rails', '>= 2.1.0'
gem 'sassc'

gem 'slim'
gem "slim-rails"

# Attachments
gem 'paperclip', '6.1.0'

# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Active admin / admin panel
gem 'activeadmin', github: 'activeadmin'
gem 'ckeditor', '4.2.4'
gem 'devise'
gem 'globalize'

# User Agent parser
gem "browser"

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

gem 'dotenv-rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Deploy
  gem 'capistrano', '~> 3.14.0'
  gem 'capistrano-rails'
  gem 'capistrano-bundler', '>= 1.1.0'
  gem 'capistrano-rvm'
  gem 'capistrano-linked-files'
  gem 'capistrano3-puma', '1.2.1'

  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  # gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

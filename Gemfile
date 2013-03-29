source 'https://rubygems.org'

gem 'rails', :git => 'git://github.com/rails/rails.git', :branch => '3-2-stable'
gem 'bootstrap-sass', '2.1'
gem 'bcrypt-ruby', '3.0.1'
gem 'active_hash', '0.9.13'
gem 'sendgrid', '1.1.0'
gem 'resque', '1.22.0', :require => 'resque/server'
gem 'resque-scheduler', '2.0.1', :require => 'resque_scheduler'
gem 'nokogiri', '1.5.6'

group :development, :test do
  gem 'sqlite3', '1.3.7'
  gem 'rspec-rails', '2.13.0'
  gem 'factory_girl_rails', '4.2.1'
  gem 'faker',   '1.1.2'
  gem 'foreman', '0.62.0'
end

group :test do
  gem 'capybara', '1.1.2'
end

group :production do
  gem 'pg', '0.14.1'
end

gem 'jquery-rails', '2.2.1'
gem 'coffee-rails', '3.2.2'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '3.2.6'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '1.3.0'
end


# To use debugger
# gem 'debugger'

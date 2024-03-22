# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.3'
gem 'bootsnap', require: false
gem 'importmap-rails'
gem 'jbuilder'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.8', '>= 7.0.8.1'
gem 'redis', '~> 4.0'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'tailwindcss-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'activestorage', '~> 7.0.8.1'
gem 'devise', '~> 4.9'
gem 'followability', github: 'nejdetkadir/followability', branch: 'main'
gem 'image_processing', '~> 1.2'
gem 'ransack', '~> 4.1', '>= 4.1.1'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]

  gem 'pry'
end

group :development do
  gem 'rubocop', '~> 1.62'
  gem 'rubocop-capybara', '~> 2.20'
  gem 'rubocop-performance', '~> 1.20'
  gem 'rubocop-rails', '~> 2.24'
  gem 'rubocop-rspec', '~> 2.26'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end

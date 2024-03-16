source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.3"
gem "rails", "~> 7.0.8", ">= 7.0.8.1"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "jbuilder"
gem "redis", "~> 4.0"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false

gem "devise", "~> 4.9"
gem "image_processing", "~> 1.2"
gem 'activestorage', '~> 7.0.8.1'
gem 'followability', github: 'nejdetkadir/followability', branch: 'main'
gem 'ransack', '~> 4.1', '>= 4.1.1'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]

  gem "pry"
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end

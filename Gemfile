source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'devise'
gem 'figaro'
gem 'omniauth-facebook'
gem 'shrine'
gem 'aws-sdk'
gem 'roda'
gem 'jquery-fileupload-rails'
gem "image_processing"
gem "mini_magick", ">= 4.3.5"

group :development, :test do
  gem 'rspec-rails'
  gem 'byebug', platform: :mri
  gem 'pry'
  gem 'launchy'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
  gem "factory_girl_rails", "~> 4.0"
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'tsuite'
  gem 'rails-controller-testing'
  gem 'selenium-webdriver', '< 3.0'
  gem "shrine-memory"
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

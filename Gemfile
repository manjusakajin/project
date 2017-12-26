source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails", "~> 5.0.2"
gem "sqlite3"
gem "puma", "~> 3.0"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem 'rails-ujs', '~> 5.1.0.beta1'
gem 'jquery-rails'
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "bootstrap-sass", "3.3.6"
gem "bcrypt", "3.1.11"
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem "config"
gem "ckeditor"      #form tao review
gem "paperclip", "5.1.0"
gem "will_paginate", "3.1.0"
gem "bootstrap-will_paginate", "0.0.10"
gem "ratyrate", github: "wazery/ratyrate" #rate
gem "faker", "1.7.3"
gem "nested_form_fields"
gem "carrierwave"
gem "mini_magick"
gem "cloudinary"
gem "omniauth"
gem "omniauth-facebook" # Facebook authentication

group :development, :test do
  gem "byebug", platform: :mri
  gem "letter_opener"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.0.5"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

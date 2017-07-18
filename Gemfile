source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.4.0"
gem "rails", "~> 5.0.4"
gem "pg", "~> 0.18"
gem "puma", "~> 3.0"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "jquery-rails"
gem "turbolinks", "~> 5"
gem "active_model_serializers"
gem "figaro"
gem "devise"
gem "font-awesome-rails"
gem "simple_form"
gem "react-rails"
gem "haml"
gem "bootstrap-sass"
gem "bootstrap-social-rails"
gem "haml-rails", "~> 0.9"
gem "slim-rails"
gem "slim"
gem "cancancan", "~> 2.0"

group :development, :test do
  gem "byebug", platform: :mri
  gem "factory_girl_rails"
  gem "ffaker"
end

group :test do
  gem "rspec-rails"
  gem "shoulda-matchers", git: "https://github.com/thoughtbot/shoulda-matchers.git", branch: "rails-5"
  gem "email_spec"
  gem "rails-controller-testing"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.0.5"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

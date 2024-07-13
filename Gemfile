source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem "rails", "~> 7.0"

gem "bootsnap", "1.18.3", require: false
gem "jbuilder"
gem "postmark"
gem "puma", "6.4.2"
gem "sqlite3"
gem "webpacker", "~> 5.0"
gem "msgpack", "1.7.2"
gem "json", "2.7.1"
gem "nio4r", "2.7.0"
gem "bindex", "0.8.1"
gem "websocket-driver", "0.7.6"
gem "racc", "1.7.3"
gem "bigdecimal", "3.1.6"
gem "io-console", "0.7.2"
gem "date", "3.3.4"
gem "psych", "5.1.2"
gem "stringio", "3.1.0"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", "1.9.1", platforms: %i[ mri mingw x64_mingw ]
  gem "dotenv-rails"
end

group :development do
  gem "web-console"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

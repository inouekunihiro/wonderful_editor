source "https://rubygems.org"
git_source(:github) {|repo| "https://github.com/#{repo}.git" }

ruby "2.7.1"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 6.0.3", ">= 6.0.3.4"
# Use postgresql as the database for Active Record
gem "pg", ">= 0.18", "< 2.0"
# Use Puma as the app server
gem "puma", "~> 4.1"
# Use SCSS for stylesheets
# gem 'sass-rails', '>= 6' *不要なためコメントイン
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem "webpacker", "~> 4.0"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7' *不要なためコメントイン
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.2", require: false
# json などをいい感じに整形して表示させてくれる gem
gem "active_model_serializers", "~> 0.10.0"
# トークン形式のユーザー認証（ user authentication )を導入してくれる gem.リクエスト毎に再発行、デバイス・クライアント毎にセッションを保持。
gem "devise_token_auth"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # gem 'byebug', platforms: [:mri, :mingw, :x64_mingw] ＊不要なためコメントイン
  # pry を立ち上げてデバッグを行うための gem
  gem "pry-byebug" # binding.pry を入れた場所でデバッグが行えるようになる。
  gem "pry-doc" # Cで書かれたRubyのソースコードを表示出来る.show-sourceコマンドを利用出来る様になる
  gem "pry-rails" # binding.pry で止めたところから next コマンドで1行ずつスキップ実行ができる。
  # 静的解析ツールrubocop (インデントを入れたら？文字が長すぎない？などとアドバイスくれる警察官)の rails 解析部分。
  gem "rubocop-rails" # , require: false は教材にはなかったので一応削除した。
  # 静的解析ツール rubocop の rspec 解析部分。
  gem "factory_bot_rails"
  gem "faker"
  gem "rspec-rails", "~> 4.0.2"
  gem "rubocop-rspec" # , require: false は教材にはなかったので一応削除した。
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem "listen", "~> 3.2"
  gem "web-console", ">= 3.3.0"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  # 現在のスキーマをまとめたコメントを model や rspec, route などのファイルの上部下部に書き出してくれる gem.
  gem "annotate"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

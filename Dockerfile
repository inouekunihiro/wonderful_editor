# Docker のイメージを自動で作成してくれるファイル

# FROM ruby:2.5
# RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# # // 「-qqオプション」はエラー以外何も吐かないことを意味する。
# # // 「-y」オプションは全部yesで実行することを意味する。

# RUN mkdir /myapp
# WORKDIR /myapp

# COPY Gemfile /myapp/Gemfile
# COPY Gemfile.lock /myapp/Gemfile.lock

# RUN bundle install
# COPY . /myapp

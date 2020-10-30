FROM ruby:2.7.0

RUN apt-get update -qq && apt-get install -y build-essential nodejs 

ENV RAILS_ROOT /home/ubuntu/merake

RUN mkdir -p $RAILS_ROOT/tmp/pids

WORKDIR $RAILS_ROOT

COPY Gemfile* ./

COPY config/puma.rb config/puma.rb

RUN bundle install

COPY . .

EXPOSE 3000
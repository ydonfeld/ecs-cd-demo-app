FROM ruby:2.2.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir -p /opt/web
WORKDIR /tmp
ADD Gemfile /tmp/
ADD Gemfile.lock /tmp/
RUN bundle install
ADD . /opt/web
WORKDIR /opt/web
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /var/tmp/*
ENV RAILS_SERVE_STATIC_FILES true
RUN bundle exec rake assets:precompile
CMD bundle exec rails server -e production -b 0.0.0.0

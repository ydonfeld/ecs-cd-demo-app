FROM jenkinsci/jnlp-slave
MAINTAINER Daniele Stroppa (stroppad@amazon.com)

# Install Ruby 2.2.2
USER root

# Quiet the update and install output
RUN apt-get update -qq && \
    apt-get install -y -qq \
      git \
      curl \
      wget \
      build-essential \
      ca-certificates \
      libyaml-dev \
      libreadline-dev \
      libcurl4-openssl-dev \
      libffi-dev \
      libgdbm-dev \
      libssl-dev \
      libxml2-dev \
      libxslt1-dev \
      libtool \
      zlib1g-dev \
      netbase

RUN apt-get install -y qt5-default libqt5webkit5-dev
RUN apt-get install -y xvfb x11-xkb-utils xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic x11-apps

RUN rm -rf /var/lib/apt/lists/* &&\
    truncate -s 0 /var/log/*log

# Set the Ruby version of your preference
ENV RUBY_VERSION 2.2.2
RUN echo 'gem: --no-document' >> /usr/local/etc/gemrc &&\
    mkdir /src && cd /src && git clone https://github.com/sstephenson/ruby-build.git &&\
    cd /src/ruby-build && ./install.sh &&\
    cd / && rm -rf /src/ruby-build && ruby-build $RUBY_VERSION /usr/local
RUN gem update --system &&\
    gem install bundler

USER jenkins

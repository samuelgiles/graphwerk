FROM ruby:4.0

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    graphviz \
  && rm -rf /var/lib/apt/lists/*

RUN gem install bundler

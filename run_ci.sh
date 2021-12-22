#!/usr/bin/env bash
set -e
rm -f Gemfile.lock
bundle install
bundle exec srb tc
bundle exec rspec spec

#!/usr/bin/env bash

echo "$(date +%m/%d/%y\ %T)"
cd /u/apps/ads.bendbulletin.com/current
bundle install

bundle exec unicorn_rails -c config/unicorn/production.rb -E production -D
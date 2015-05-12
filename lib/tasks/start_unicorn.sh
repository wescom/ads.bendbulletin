#!/usr/bin/env bash

echo "$(date +%m/%d/%y\ %T)"
cd /u/apps/ads.bendbulletin.com/current
bundle install>>/tmp/null

rm /u/apps/ads.bendbulletin.com/current/tmp/pids/unicorn.pid 
bundle exec unicorn_rails -c config/unicorn/production.rb -E production -D

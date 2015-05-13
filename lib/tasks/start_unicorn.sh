#!/usr/bin/env bash

echo "$(date +%m/%d/%y\ %T)"
cd /u/apps/ads.bendbulletin.com/current
bundle install>>/tmp/null

bundle exec unicorn_rails -c config/unicorn/production.rb -E production -D
chmod 777 /u/apps/ads.bendbulletin.com/shared/pids/unicorn.pid

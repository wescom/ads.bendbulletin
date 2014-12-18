#!/usr/bin/env bash

echo "$(date +%m/%d/%y\ %T)"
cd /u/apps/ads.bendbulletin.com/current
bundle install

bundle exec rake ad_upload:delete_old_jobs RAILS_ENV=production
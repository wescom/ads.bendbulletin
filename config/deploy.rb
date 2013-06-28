set :application, "ads.bendbulletin.com"
set :repository,  "git@github.com:wescom/ads.bendbulletin.git"
default_run_options[:pty] = true

role :web, "172.16.128.125"                       # Your HTTP server, Apache/etc
role :app, "172.16.128.125"                       # This may be the same as your `Web` server
role :db,  "172.16.128.125", :primary => true     # This is where Rails migrations will run

set :ssh_options, { :forward_agent => true }

# Needed to have coaistrano run bundle install on deploy
require 'bundler/capistrano'
require 'capistrano-unicorn'

after 'deploy:restart', 'unicorn:reload'    # app IS NOT preloaded
after 'deploy:restart', 'unicorn:restart'   # app preloaded


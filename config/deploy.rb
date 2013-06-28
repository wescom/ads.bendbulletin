# Needed to have capistrano run bundle install on deploy
require 'bundler/capistrano'

set :application, "ads.bendbulletin.com"

# SSH configuration
default_run_options[:pty] = true

# Source repository taken for deployments
set :repository,  "git@github.com:wescom/ads.bendbulletin.git"
set :ssh_options, { :forward_agent => true }
set :bundle_flags, ''

# Destination of deployments
# set :deploy_to, '/home/myuser/myapp_deployed'
# set :deploy_via, :copy

role :web, "172.16.128.125"                       # Your HTTP server, Apache/etc
role :app, "172.16.128.125"                       # This may be the same as your `Web` server
role :db,  "172.16.128.125", :primary => true     # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
after 'deploy:restart', 'deploy:cleanup'

# Unicorn tasks
require 'capistrano-unicorn'
after 'deploy:restart', 'unicorn:reload'    # app IS NOT preloaded
after 'deploy:restart', 'unicorn:restart'   # app preloaded


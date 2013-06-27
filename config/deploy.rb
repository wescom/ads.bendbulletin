set :application, "ads.bendbulletin.com"
set :repository,  "git@github.com:wescom/ads.bendbulletin.git"
default_run_options[:pty] = true

role :web, "172.16.128.125"                       # Your HTTP server, Apache/etc
role :app, "172.16.128.125"                       # This may be the same as your `Web` server
role :db,  "172.16.128.125", :primary => true     # This is where Rails migrations will run

set :ssh_options, { :forward_agent => true }

# Needed to have coaistrano run bundle install on deploy
require 'bundler/capistrano'

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
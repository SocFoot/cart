
set :application, "depot"

set :repository, "git@github.com:SocFoot/depot.git"

set :scm, :git

set :branch, "master"

set :user, "cedric"

set :deploy_to, "/home/cedric/Documents/www"

set :deploy_via, :remote_cache

set :passenger_restart_with_touch, true

set :use_sudo, false

set :rails_env, "production"

set :ssh_options, { :forward_agent => true, :port => 22 }

set :keep_releases, 5

default_run_options[:pty] = true

server "depot.com", :app, :web, :db, :primary => true


role :app, "depot.com"

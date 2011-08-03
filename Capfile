require 'capistrano/version'
require 'rubygems'
require 'capinatra'
load 'deploy' if respond_to?(:namespace) # cap2 differentiator

# set an app_class if you're using the more recent style of creating
# Sinatra apps, where app_class would be the name of your subclass
# of Sinatra::Base. if you're just requiring 'sinatra' and using the
# more traditional DSL style of Sinatra, then comment this line out.
set :app_class, 'GitPad'

# standard settings
set :app_file, "app.rb"
set :application, "gitpad"
set :domain, "ensemble"
role :app, domain
role :web, domain
role :db,  domain, :primary => true

# environment settings
set :user, "gitpad"
set :group, "gitpad"
set :deploy_to, "/usr/local/gitpad"
set :deploy_via, :remote_cache
default_run_options[:pty] = true

# scm settings
set :repository, "git@github.com:mmm/gitpad.git"
set :scm, "git"
set :branch, "master"
set :git_enable_submodules, 1

# where the apache vhost will be generated
set :apache_vhost_dir, "/etc/apache2/sites-available/"

namespace :deploy do
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

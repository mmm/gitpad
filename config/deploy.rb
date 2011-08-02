set :application, "gitpad"
set :repository,  "git@github.com:mmm/gitpad.git"

set :scm, :git

role :web, "ensemble.markmims.com"
role :app, "ensemble.markmims.com"
role :db,  "ensemble.markmims.com", :primary => true

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

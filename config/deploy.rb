#Site5 specific stuff
set :use_sudo, false
set :group_writable, false
 
# Less releases, less space wasted
set :keep_releases, 2
 
# The mandatory stuff
set :application, "lafacroft"
set :user, "lafacrof"

#Git info
default_run_options[:pty] = true
set :repository,  "git://github.com/chipmunk884/Lafacroft.git"
set :scm, "git"
set :branch, "master"
#set :deploy_via, :remote_cache
 
# This is related to site5 too.
set :deploy_to, "/home/#{user}/#{application}"
role :app, "lafacroft.com"
role :web, "lafacroft.com"
role :db,  "lafacroft.com", :primary => true
 
# Create Site5 specific tasks
namespace :deploy do
  desc "Deploy app, run migrations, and start Phusion Passenger"
  task :cold do
    update
    site5::link_public_html
    restart
  end
 
  desc "Restart Phusion Passenger"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
  
  desc "Start application -- not needed for Passenger"
  task :start, :roles => :app do
    #nothing, needs to be blank to make Passenger work properly
  end
 
  namespace :site5 do
    desc "Link the public folder of the application to public_html"
    task :link_public_html do
      run "cd /home/#{user}; rm -rf public_html; ln -s #{current_path}/public ./public_html"
    end
  end
end
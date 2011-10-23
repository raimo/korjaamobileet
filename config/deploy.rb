set :application, "korjaamobileet"
set :repository,  "git://github.com/raimo/korjaamobileet.git"
set :scm, :git
set :git_enable_submodules, 1

default_run_options[:pty] = true
set :deploy_via, :remote_cache
set :use_sudo, false
set :deploy_to, "/home/users/raimo/#{application}"
set :group_writable, false

set :rails_env, "production"
set :startcmd, "CATALINA_PID=tomcat.pid tomcat/bin/startup.sh;"
set :stopcmd, "CATALINA_PID=tomcat.pid tomcat/bin/shutdown.sh -force;"

role :app, "kirsikka.kapsi.fi"
role :web, "kirsikka.kapsi.fi"
role :db,  "kirsikka.kapsi.fi", :primary => true

namespace :deploy do

  task :warble do
    run "cd #{release_path};warble RAILS_ENV=#{rails_env}"
    run "rm -rf tomcat/webapps/leet.war tomcat/webapps/leet"
    run "mv #{release_path}/leet.war tomcat/webapps"
  end

  task :start do
    run startcmd
  end
 
  task :stop do
    run stopcmd
  end

  task :restart do
    run stopcmd+startcmd
  end

  task :bundle do
    run "cd #{release_path} && bundle"
  end

  task :config do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
end

after 'deploy:update_code', 'deploy:config', 'deploy:bundle', 'deploy:warble'

set :application, "korjaamobileet"
set :repository,  "git://github.com/raimo-t/korjaamobileet.git"
set :scm, :git

default_run_options[:pty] = true
set :deploy_via, :remote_cache
set :use_sudo, false
set :deploy_to, "/home/users/raimo/#{application}"
set :group_writable, false

set :pid, "#{current_path}/tmp/pids/unicorn.pid"
set :cmd, "(cd #{current_path} && unicorn_rails -D -E production -c config/unicorn.rb)"

role :app, "kirsikka.kapsi.fi"
role :web, "kirsikka.kapsi.fi"
role :db,  "kirsikka.kapsi.fi", :primary => true

namespace :deploy do
  task :stop do
    run("test -s '#{pid}' && kill -QUIT `cat '#{pid}'`")
  end

  task :restart do
    run("(test -s '#{pid}' && kill -USR2 `cat '#{pid}'`) || #{cmd}")
  end

  task :start do
    run("(test -s '#{pid}' && kill -0 `cat '#{pid}'`) || #{cmd}")
  end
end

namespace :customs do
  task :config do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
end

after "deploy:update_code", "customs:config"


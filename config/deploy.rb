$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require "rvm/capistrano"
set :rvm_ruby_string, File.new('.rvmrc').read.split(' ').find{|s|s.include?('@')}
set :rvm_type, :user


set :application, "korjaamobileet"
set :repository,  "git://github.com/raimo/korjaamobileet.git"
set :scm, :git
set :git_enable_submodules, 1

default_run_options[:pty] = true
set :deploy_via, :remote_cache
set :use_sudo, false
set :deploy_to, "/home/users/raimo/#{application}"
set :group_writable, false

set :pid, "#{current_path}/tmp/pids/passenger.31010.pid"
set :bundle, "(cd #{current_path}; bundle)"
set :cmd, "(cd #{current_path}; bundle exec passenger start -d -p 31010 -e production #{current_path})"

role :app, "kirsikka.kapsi.fi"
role :web, "kirsikka.kapsi.fi"
role :db,  "kirsikka.kapsi.fi", :primary => true

namespace :deploy do
  task :stop do
    run("test -s '#{pid}' && kill -QUIT `cat '#{pid}'`")
  end

  task :restart do
    run("#{bundle} && touch #{current_path}/tmp/restart.txt")
  end

  task :start do
    run("#{bundle} && (test -s '#{pid}' && kill -0 `cat '#{pid}'`) || #{cmd}")
  end
end

namespace :customs do
  task :config do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
end

after "deploy:update_code", "customs:config"


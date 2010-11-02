worker_processes 2
preload_app true
timeout 30
listen 31010
RAILS_ROOT = File.dirname(File.dirname(__FILE__))
stderr_path RAILS_ROOT + '/log/unicorn.log'

after_fork do |server, worker|
  ActiveRecord::Base.establish_connection
end

before_fork do |server, worker|
  old_pid = RAILS_ROOT + '/tmp/pids/unicorn.pid.oldbin'
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # ignore
    end
  end
end

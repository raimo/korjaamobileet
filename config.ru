# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
map (ENV['RACK_ENV'].to_s == 'production' ? '/testing' : '') do
	run Tellajoke::Application
end

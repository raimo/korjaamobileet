require 'failurous'

Failurous::Config.server_address = 'http://failurous.r10.railsrumble.com/'
Failurous::Config.api_key = '2de92b64-d7c3-4c9b-8290-016ba49ab64d'

Rails.application.config.middleware.use(Failurous::FailMiddleware)

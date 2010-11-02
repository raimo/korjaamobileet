# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_korjaamobileet_session',
  :secret      => 'e2c8bd9dc9d891958714d8fa2270730678b09074b5994df6fb778afdc1b1c1236d4f1d8fe1130244e1a42410bc6640102fff523b68006d425765b82c03d3d887'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

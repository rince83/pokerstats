# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_pokerstats_session',
  :secret      => 'f4f3d91797a03ba7d37626694ee8de1e1c309a6a908ea22123e099647c258befd7bf114f1881e25a08d2a92807e090cd4db7462f07f7d27c32969f8f4d3c78d1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

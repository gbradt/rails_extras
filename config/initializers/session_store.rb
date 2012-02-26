# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_extras_session',
  :secret      => 'e511bbb31c1507afd695611ec9f563b5ab47e6b6ecd50c3e0d40161de3d14ace0d22e34a82815aefb8783ec2808191db9eb51928719cdc5006257bd3958e636c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

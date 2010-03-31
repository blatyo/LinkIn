# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_LinkIn_session',
  :secret      => 'fb76d95992a36bd572dd741cf9e66202938c6a1219ef00af490ee26f03c6a28bdcee2f8f7a3d4cdb1ab9ea0953126654672c96d7d5573b607a452a1bf7392474'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

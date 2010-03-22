# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_my-tasks_session',
  :secret      => 'a5c5c41910bb9c25ae12a900d2fb69fed916214d795d24fd66706a3425d5a035c123e52b82c9c7b6024c3c356364fc6f5509ef9b39a4cac2424bf3d06f2b5fc9'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

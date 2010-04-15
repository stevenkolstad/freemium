# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_dummy_session',
  :secret => '887f2a52bb28e8a98d18ab547fe6ff81b3e1c29ed4a3d7036c66ffb439296a69fa13566eea2e778928f4331bef9b1ec2f4822a58873a2642206d2021e194ce52'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

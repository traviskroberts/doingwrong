# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_doingwrong_session',
  :secret      => '1da08332deaf31b55fc25bbedd7c10ced7af61f4748352fe9a42fbc0444a10178644fba37d7ab4b0f2482a1f14e7a95b863728f3ee1ee311103d421a749daeb8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

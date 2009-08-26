# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_lafacroft_session',
  :secret      => '7349a574d2fe28c807c5809235e6691f16a109babe75776b05271a4d5df94d425fc98505cb6da822a7559cd5a393a8635675440fcb4a66e4a0a2717be7353601'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

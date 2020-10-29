require 'pg'
require_relative '../lib/connection'
def setup_test_database
  p "Setting up test database"

  Connection.connect('makers_bnb_manager_test')

  Connection.query("TRUNCATE spaces, users;")
end

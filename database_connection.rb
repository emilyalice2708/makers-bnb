require './lib/connection.rb'

if ENV['ENVIRONMENT'] == 'test'
    Connection.connect('makers_bnb_manager_test')
  else
    Connection.connect('makers_bnb_manager')
  end
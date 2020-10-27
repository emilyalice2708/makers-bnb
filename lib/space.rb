require 'pg'
require_relative 'connection'

class Space

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = Connection.connect('makers_bnb_manager_test')
    else
      connection = Connection.connect('makers_bnb_manager')
    end
    @result = connection.query("SELECT * FROM spaces;")
    @result.map do |space|
      space['name']
    end
  end

end
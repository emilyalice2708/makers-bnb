require 'pg'
require_relative 'connection'
require_relative '../database_connection.rb'

class Space

  def self.all
    
    @result = Connection.query("SELECT * FROM spaces;")
    @result.map do |space|
      space['name']
    end
  end

  def self.create(name:)
    connection = PG.connect(dbname: 'makers_bnb_manager_test')
    connection.exec("INSERT INTO spaces (name) VALUES('#{name}');")
  end

end
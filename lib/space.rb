require 'pg'
require_relative 'connection'
require_relative '../database_connection.rb'

class Space
  attr_reader :id, :name, :description

  def initialize(id:, name:, description:)
    @name = name
    @id = id
    @description = description
  end

  def self.all
    result = Connection.query("SELECT * FROM spaces;")
    result.map do |space|
      ## Map through each space from the table and make them all space objects:
      Space.new(id: space['id'], name: space['name'], description: space['description'])
    end
  end
  
  def self.create(name:, description:)
    ## RETURNING id, name so that we can use them in Space.new below...
    result = Connection.query("INSERT INTO spaces (name, description) VALUES('#{name}', '#{description}') RETURNING id, name, description;")
    ## Create a new space object using the information we just inserted:
    Space.new(id: result[0]['id'], name: result[0]['name'], description: result[0]['description'])
  end

end
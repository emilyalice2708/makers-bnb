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
      Space.new(id: space['id'], name: space['name'], description: space['description'])
    end
  end
  
  def self.create(name:, description:)
    result = Connection.query("INSERT INTO spaces (name, description) VALUES('#{name}', '#{description}') RETURNING id, name, description;")
    Space.new(id: result[0]['id'], name: result[0]['name'], description: result[0]['description'])
  end

end
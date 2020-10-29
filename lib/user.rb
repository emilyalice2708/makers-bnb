require 'pg'
require_relative 'connection'
require_relative '../database_connection.rb'

class User

  def self.create(email:, password:, display_name:)

    result = Connection.query("INSERT INTO users (email, password, display_name) VALUES ('#{email}', '#{password}', '#{display_name}') RETURNING id, email, password, display_name;")
    User.new(id: result[0]['id'],
      email: result[0]['email'],
      password: result[0]['password'],
      display_name: result[0]['display_name']
    )
  end
    attr_reader :id, :email, :password, :display_name

    def initialize(id:, email:, password:, display_name:)
      @id = id
      @email = email
      @password = password
      @display_name = display_name
    end
end

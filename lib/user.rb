require 'pg'
require_relative 'connection'
require_relative '../database_connection.rb'
require 'bcrypt'

class User
  def self.create(email:, password:, display_name:)
    encrypted_password = BCrypt::Password.create(password)
    result = Connection.query("INSERT INTO users (email, password, display_name) VALUES ('#{email}', '#{encrypted_password}', '#{display_name}') RETURNING id, email, password, display_name;")
    User.new(id: result[0]['id'],
      email: result[0]['email'],
      password: result[0]['password'],
      display_name: result[0]['display_name']
    )
  end

  def self.find(id:)
    return nil unless id

    result = Connection.query("SELECT * FROM users WHERE id = #{id}")
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

  def self.authenticate(email:, password:)
    result = Connection.query("SELECT * FROM users WHERE email = '#{email}';")
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    User.new(id: result[0]['id'],
      email: result[0]['email'],
      password: result[0]['password'],
      display_name: result[0]['display_name']
    )
  end
end

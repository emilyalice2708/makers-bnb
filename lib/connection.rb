require 'pg'

class Connection

  def self.connect(dbname)
    @connection = PG.connect(dbname: dbname)
  end

  def self.return_connection
    @connection
  end

  def self.query(sql_query)
    @connection.exec(sql_query)
  end
end
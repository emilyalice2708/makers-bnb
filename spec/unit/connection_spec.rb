require 'pg'
require 'connection'

describe Connection do
  
  describe '.connect' do 
    it 'connects to the database' do
      expect(PG).to receive(:connect).with(dbname: 'makers_bnb_manager_test')
      Connection.connect('makers_bnb_manager_test')
    end

    it 'creates a persistent connection' do
      connection = Connection.connect('makers_bnb_manager_test')
      expect(Connection.return_connection).to eq connection
    end
  end

  describe '.query' do
    it 'executes SQL queries on the correct database' do
      connection = Connection.connect('makers_bnb_manager_test')
      expect(connection).to receive(:exec).with("SELECT * FROM spaces;")
      Connection.query("SELECT * FROM spaces;")
    end
  end
end


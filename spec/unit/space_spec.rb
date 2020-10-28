require 'space'
require 'pg'
describe Space do
  describe '.all' do
    it 'returns all spaces' do
      connection = PG.connect(dbname: 'makers_bnb_manager_test')
      connection.exec("INSERT INTO spaces (name) VALUES ('Private room rotherhithe');")
      connection.exec("INSERT INTO spaces (name) VALUES ('Entire apartment in westminster');")
      connection.exec("INSERT INTO spaces (name) VALUES ('Private room westminster');")
  
      expect(Space.all).to include 'Private room rotherhithe'
      expect(Space.all).to include 'Entire apartment in westminster'
      expect(Space.all).to include 'Private room westminster'
    end
  end

  describe '.create' do
    it 'creates a new space' do
      
    end
  end
end

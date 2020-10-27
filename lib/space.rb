require 'pg'

class Space

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makers_bnb_manager_test')
    else
      connection = PG.connect(dbname: 'makers_bnb_manager')
    end

    @result = connection.exec("SELECT * FROM spaces;")
    @result.map do |space|
      space['name']
    end
  end

end
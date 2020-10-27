require 'sinatra/base'
require 'pg'

class BnbManager < Sinatra::Base

  run! if app_file == $0

  get '/' do
    erb :index
  end

  get '/spaces' do
    connection = PG.connect(dbname: 'makers_bnb_manager_test')
    @result = connection.exec("SELECT * FROM spaces;")
    erb :'/spaces/index'
end
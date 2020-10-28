require 'sinatra/base'
require 'pg'
require_relative './lib/space'
require_relative './database_connection.rb'
require_relative './lib/connection'

class BnbManager < Sinatra::Base

  run! if app_file == $0

  get '/' do
    erb :index
  end

  get '/spaces' do
    @result = Space.all
    ## Before, result looked like: ["room in rotherhithe", "room in westiminster"]
    ## Now, result looks like: [space_object_1, space_object_2]
    p @result
    erb :'/spaces/index'
  end

  get '/spaces/new' do
    erb :'/spaces/new'
  end

  post '/spaces' do
    Space.create(name: params[:space_name])

    
    redirect to '/spaces'
  end

end
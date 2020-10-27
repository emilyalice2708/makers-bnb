require 'sinatra/base'
require 'pg'
require_relative './lib/space'

class BnbManager < Sinatra::Base

  run! if app_file == $0

  get '/' do
    erb :index
  end

  get '/spaces' do
    @result = Space.all
    erb :'/spaces/index'
  end

end
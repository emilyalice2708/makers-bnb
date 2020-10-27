require 'sinatra/base'

class BnbManager < Sinatra::Base

  run! if app_file == $0

  get '/' do
    erb :index
  end
end
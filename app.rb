require 'sinatra/base'
require 'pg'
require_relative './lib/space'
require_relative './database_connection.rb'
require_relative './lib/connection'
require_relative './lib/user.rb'

class BnbManager < Sinatra::Base
  enable :sessions

  run! if app_file == $0

  get '/' do
    erb :index
  end

  get '/spaces' do
    @result = Space.all
    @user = User.find(id: session['id'])
    erb :'/spaces/index'
  end

  get '/spaces/new' do
    erb :'/spaces/new'
  end

  post '/spaces' do
    Space.create(name: params[:space_name],
      description: params[:description],
      user_id: session['id'],
      price: params[:price]
    )

    redirect to '/spaces'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params['email'], password: params['password'], display_name: params['display_name'])
    session['id'] = @user.id
    redirect '/spaces'
  end

  get '/spaces/:id' do
    @space = Space.find(id: params[:id])
    erb :'spaces/view_space'
  end

  get '/sessions/new' do
    erb:'sessions/new'
  end

  post '/sessions' do

    result = Connection.query("SELECT * FROM users WHERE email = '#{params[:email]}';")
    user = User.new(id: result[0]['id'], email: result[0]['email'], password: result[0]['password'], display_name: result[0]['display_name'])
    session[:user_id] = user.id


    redirect '/spaces'
  end

end

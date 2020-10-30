require 'sinatra/base'
require 'pg'
require_relative './lib/space'
require_relative './database_connection.rb'
require_relative './lib/connection'
require_relative './lib/user.rb'
require 'sinatra/flash'
require 'sinatra'
require 'stripe'
ENV['SECRET_KEY'] = "sk_test_51HhnLmJgx7WFG8VYXHIgNqMgeJZvwsPeMD6PYKEnDgEXwaH21498gHqLBcIZjSdonaUiKY8Z58JTijArSB341KgW0082E8WCqt"


class BnbManager < Sinatra::Base
  enable :sessions

  set :publishable_key, ENV['PUBLISHABLE_KEY']
  set :secret_key, ENV['SECRET_KEY']

  Stripe.api_key = settings.secret_key

  error Stripe::CardError do
  env['sinatra.error'].message
end

  register Sinatra::Flash
  set :public_folder, File.expand_path('./public', __dir__)

  run! if app_file == $0

  get '/' do
    redirect to '/spaces'
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

    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect '/spaces'
    else
      flash[:notice] = 'Check your email or password'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    redirect('/spaces')
  end

  post '/charge' do
  # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create({
      email: params[:email],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      amount: @amount,
      description: 'Sinatra Charge',
      currency: 'gbp',
      customer: customer.id,
    })
    redirect '/success'
  end

  get '/success' do
    erb :charge
  end

end

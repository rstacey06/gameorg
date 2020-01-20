class UsersController < ApplicationController

  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    user = User.new(params)
    if user.save
      session[:user_id] = user.id
      redirect '/library'
    else
      redirect '/'
    end
  end

  get '/login' do
    erb :'/users/login'
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to "/library"
    else
      redirect to '/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect to '/'
    else
      redirect to '/'
    end
  end

  get '/users/:id' do
    erb :index
  end
end

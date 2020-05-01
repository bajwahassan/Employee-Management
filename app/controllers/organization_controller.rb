class OrganizationController < ApplicationController

  get '/' do
    erb :home
  end

  post '/signup' do

    if params[:name] == "" || params[:email] == "" || params[:password] == ""
      redirect '/'
      #creata a feature to raise an error if user already exists with this email
    else
      Organization.create(name: params[:name], email: params[:email], password: params[:password])
      redirect '/login'
    end

  end

  get '/login' do
    erb :login
  end

  post '/login' do
    @user = Organization.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to "/account"
    else
      redirect "/failure"
    end
  end

  get '/failure' do
    erb :"/failures/EmailOrPw"
  end


end

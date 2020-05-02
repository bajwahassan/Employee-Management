class OrganizationController < ApplicationController

  get '/' do
    erb :"organization/home"
  end

  post '/signup' do

    if params[:organization][:name] == "" || params[:organization][:email] == "" || params[:organization][:password] == ""
      redirect '/'
      # raise an error if user already exists with this email =>
    elsif Organization.find_by(email: params[:email])
      redirect '/failure/invalidemail'
    else
      Organization.create(name: params[:organization][:name], email: params[:organization][:email], password: params[:organization][:password])
      redirect '/login'
    end

  end

  get '/login' do
    erb :"/organization/login"
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

  get '/account' do
    if session[:user_id] == nil
      redirect '/'
    end
    @employees = Employee.where(organization_id: session[:user_id])

    @user = Organization.find(session[:user_id])


    erb :"organization/account"

  end

  get '/:organization/employee/new' do
    if session[:user_id] == nil
      redirect '/'
    end
    erb :"/employee/new"
  end

  post '/employee/new' do
    @employee = Employee.create(name: params[:employee][:name], title: params[:employee][:title], department: params[:employee][:department], address: params[:employee][:address], phone_number: params[:employee][:phone_number], remarks: params[:employee][:remarks])
    @employee.organization = Organization.find(session[:user_id])
    @employee.save
    session[:employee_id] = @employee.id

    redirect '/account'
  end

  get '/failure/invalidemail' do
    erb :"failures/InvalidEmail"
  end

  get '/failure' do
    erb :"failures/WrongEmailOrPw"
  end

  post '/logout' do
    session.clear
    redirect '/'
  end




end

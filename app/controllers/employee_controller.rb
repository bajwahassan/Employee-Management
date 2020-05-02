class EmployeeController < ApplicationController

  get '/employee/:id/edit' do
    redirect '/' if !logged_in?
    @employee = Employee.find(params[:id])
    erb :"employee/edit"
  end

  patch '/employee/:id' do
    @employee = Employee.find(params[:id])
    @employee.update(params[:employee])
    erb :"employee/employe"
  end

  delete '/employee/delete/:id' do
    redirect '/' if !logged_in?
    Employee.destroy(params[:id])
    redirect '/account'
  end

end

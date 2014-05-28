class UsersController < ApplicationController
  def signup
    @email = params[:user][:email]
    render
  end

  def create
    user = User.create(email: params[:user][:email], first_name: params[:user][:first_name], last_name: params[:user][:last_name], location: params[:user][:location])
    puts user.id
    redirect_to "/users/#{user.id}"
  end

  def show
    @id = params[:id]
    render
  end
end

class UsersController < ApplicationController
  def signup
    if params[:user][:email]
      @email = params[:user][:email]
    end
  end

  def create
    @user = User.new(email:                 params[:user][:email],
                     first_name:            params[:user][:first_name],
                     last_name:             params[:user][:last_name],
                     location:              params[:user][:location],
                     password:              params[:user][:password],
                     password_confirmation: params[:user][:password_confirmation])
    if @user.save
      session[:current_user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      @errors = @user.errors
      render('signup')
    end
  end

  def show
    @id = params[:id]
  end
end

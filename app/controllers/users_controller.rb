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
    @id = params[:id].to_i
  end

  def verify_cancel
    @id = session[:current_user_id]
  end

  def destroy
    if params[:id].to_i == session[:current_user_id]
      User.find(session[:current_user_id]).destroy
      reset_session
      redirect_to root_path
    else
      @errors = "could not execute, account does not match current user"
      @id = params[:id].to_i
      render('verify_cancel')
    end
  end

end

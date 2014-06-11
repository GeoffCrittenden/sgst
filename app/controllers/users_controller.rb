class UsersController < ApplicationController

  def signup
  end

  def create
    @user = User.new(email:                 params[:user][:email],
                     first_name:            params[:user][:first_name],
                     last_name:             params[:user][:last_name],
                     location:              params[:user][:location],
                     password:              params[:user][:password],
                     password_confirmation: params[:user][:password_confirmation])
    if @user.save && params[:user][:target]
      session[:current_user_id] = @user.id
      suggestion = Suggestion.create(user_id: session[:current_user_id],
                                     target: params[:user][:target],
                                     title: params[:user][:title],
                                     body: params[:user][:body],
                                     score: 1,
                                     local: params[:user][:local])
      redirect_to "/suggestions/#{suggestion.id}"
    elsif @user.save
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

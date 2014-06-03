class SessionsController < ApplicationController

  def new
    render('signin')
  end

  def create
    if authenticate!
      session[:current_user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      render('signin')
    end
  end

  def signout
    reset_session
    redirect_to root_path
  end

  private

  def authenticate!
    @errors = {}
    if @user = User.find_by(email: params[:session][:email])
      if @user.password == params[:session][:password]
        return true
      else
        @errors[:password] = "invalid password"
        return false
      end
    else
      @errors[:email] = "user does not exist"
      return false
    end
  end

end

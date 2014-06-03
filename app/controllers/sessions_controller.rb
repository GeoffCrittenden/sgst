class SessionsController < ApplicationController

  def signin
    
  end

  def create
    if authenticate!
      session[:id]
      redirect_to "/users/#{@user.id}"
    else
      render('signin')
    end
  end

  private

  def authenticate!
    @errors = []
    if @user = User.find_by(email: params[:session][:email])
      if @user.password == params[:session][:password]
        return true
      else
        @errors << "invalid password"
        return false
      end
    else
      @errors << "user does not exist"
      return false
    end
  end

end

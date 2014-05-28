class UsersController < ApplicationController
  def signup
    @email = params[:user][:email]
    render
  end

  def create
    
  end
end

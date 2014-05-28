class UsersController < ApplicationController
  def signup
    @email = params[:email]
    render
  end

  def create
    @user = User.new(email: params[:email])
    render
  end
end

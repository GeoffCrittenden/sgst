class SuggestionsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @suggestion = Suggestion.new(user_id: session[:current_user_id],
                                 target: params[:suggestion][:target],
                                 title: params[:suggestion][:title],
                                 body: params[:suggestion][:body],
                                 score: 0,
                                 local: params[:suggestion][:local])
    if @suggestion.save
      redirect_to "/suggestions/#{@suggestion.id}"
    elsif @suggestion.errors.count == 1 && @suggestion.errors[:user_id]
      p @suggestion.errors
      @message = "Welcome to Suggestion Box.  Please create an account to post your Suggestion."
      render('users/signup')
    else
      @errors = @suggestion.errors
      render('suggestions/new')
    end
  end

  def show
    @suggestion = Suggestion.find(params[:id])
    @comments = @suggestion.comments
  end
end

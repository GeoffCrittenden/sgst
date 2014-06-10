class SuggestionsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @suggestion = Suggestion.create(user_id: session[:current_user_id], target: params[:suggestion][:target], title: params[:suggestion][:title], body: params[:suggestion][:body], local: params[:suggestion][:local])
    redirect_to "/suggestions/#{@suggestion.id}"
  end

  def show
    @suggestion = Suggestion.find(params[:id])
    @comments = @suggestion.comments
  end
end

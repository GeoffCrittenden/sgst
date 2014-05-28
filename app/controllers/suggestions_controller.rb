class SuggestionsController < ApplicationController
  def index
    
  end

  def new
    
  end

  def show
    @suggestion = Suggestion.find(params[:id])
    @comments = @suggestion.comments
  end
end

class SuggestionsController < ApplicationController
  def index
    
  end

  def show
    @suggestion = Suggestion.find(params[:id])
    @comments = @suggestion.comments
  end
end

class HomeController < ApplicationController
  def index
    @suggestions = Suggestion.order(created_at: :desc).limit(10)
  end
end

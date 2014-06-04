class HomeController < ApplicationController
  def index
    @suggestions = Suggestion.order(created_at: :desc).where(local: false).limit(10)
    @suggestions_local = Suggestion.order(created_at: :desc).where(local: true).limit(10)
  end
end

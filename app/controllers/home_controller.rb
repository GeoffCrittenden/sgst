class HomeController < ApplicationController
  def index
    @suggestions = Suggestion.all[0..9]
  end
end

class HomeController < ApplicationController
  def index
    @suggestions = Suggestion.all[-10..-1]
  end
end

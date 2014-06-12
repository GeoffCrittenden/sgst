class CommentsController < ApplicationController
  def create
    @comment = Comment.create(user_id: session[:current_user_id],
                              suggestion_id: params[:suggestion_id],
                              body: params[:comment][:body],
                              vote: params[:comment][:vote])
    Suggestion.find(params[:suggestion_id]).update_score!
    redirect_to "/suggestions/#{@comment.suggestion_id}"
  end
end

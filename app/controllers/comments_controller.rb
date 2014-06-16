class CommentsController < ApplicationController
  def create
    @comment = Comment.new(user_id: session[:current_user_id],
                           suggestion_id: params[:suggestion_id],
                           body: params[:comment][:body],
                           vote: params[:comment][:vote])
    if @comment.save
      Suggestion.find(params[:suggestion_id]).update_score!
      redirect_to "/suggestions/#{@comment.suggestion_id}"
    else
      @errors = @comment.errors
      render('comments/new')
    end
  end
end

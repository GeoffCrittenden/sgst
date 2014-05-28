class CommentsController < ApplicationController
  def create
    @comment = Comment.create(owner_id: 1, suggestion_id: params[:suggestion_id], body: params[:comment][:body], vote: params[:comment][:vote])
    redirect_to "/suggestions/#{@comment.suggestion_id}"
  end
end

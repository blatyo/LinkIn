class CommentsController < ApplicationController
  before_filter :require_user

  def create
    @chat = Chat.find(params[:chat_id])
    @comment = @chat.comments.build(params[:comment])
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Comment created!"
    else
      flash[:notice] = "Unable to create comment."
    end

    redirect_to :back
  end
end

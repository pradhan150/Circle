class Comment::LikesController < ApplicationController
  def create
    @comment = Comment.find_by(id: params[:comment_id])
    @like = @comment.likes.create(user_id: current_user.id)
    @count = @comment.likes.size
  end

  def destroy
    @like = current_user.likes.find_by(id: params[:id])
    @comment = Comment.find_by(id: params[:comment_id])
    @like.destroy
    @count = @comment.likes.size
  end
end

class CommentsController < ApplicationController
  def index
    @post = Post.find_by(id: params[:post_id])
  end

  def create
    @comment = current_user.comments.create(comment_params)
    @post = @comment.post
    flash.now[:notice] = "your comment has been sent successfully"
  end

  def destroy
    @comment = current_user.comments.find_by(id: params[:id])
    @post = @comment.post
    @comment.destroy

    render 'index'
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end

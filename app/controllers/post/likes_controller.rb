class Post::LikesController < ApplicationController
  def create
    @post = Post.find_by(id: params[:post_id])
    @like = @post.likes.create(user_id: current_user.id)
    @count = @post.likes.size
  end

  def destroy
    @like = current_user.likes.find_by(id: params[:id])
    @post = Post.find_by(id: params[:post_id])
    @like.destroy
    @count = @post.likes.size
  end
end

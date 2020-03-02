class PostsController < ApplicationController
  def create
    @post = current_user.posts.create(post_params)
    flash[:notice] = "your post has been sent successfully"

    redirect_to group_path(@post.group_id)
  end

  def destroy
    @post = current_user.posts.find_by(id: params[:id])
    group_id = @post.group_id
    @post.destroy

    redirect_to group_path(group_id)
  end

  private

  def post_params
    params.require(:post).permit(:body, :group_id, images: [])
  end
end

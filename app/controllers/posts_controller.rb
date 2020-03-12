class PostsController < ApplicationController
  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:notice] = 'your post has been sent successfully'
    else
      flash[:danger] = 'something went wrong'
    end

    redirect_to group_path(@post.group_id)
  end

  def destroy
    @post = current_user.posts.find_by(id: params[:id])
    if @post.blank?
      flash[:notice] = 'could not destroy post!!!'
      redirect_to root_path(current_user)
    end

    group_id = @post.group_id
    @post.destroy

    redirect_to group_path(group_id)
  end

  private

  def post_params
    params.require(:post).permit(:body, :group_id, images: [])
  end
end

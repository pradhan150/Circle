require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before do
    @post = create(:post)
    @user = @post.user
    @group = @post.group
    sign_in @user
  end

  describe "POST #create" do
    context "if post is valid" do
      it "increase the count of posts" do
        expect {
          post :create, params: { post: { body: "testing", group_id: @group.id }}
        }.to change(Post, :count).by(1)
      end
    end

    context "if post is invalid" do
      it "does not increase the count of posts" do
        expect {
            post :create, params: { post: { body: nil, group_id: @group.id }}
          }.to change(Post, :count).by(0)
      end
    end

    it "redirect to the show of group" do
      post :create, params: { post: { body: "testing", group_id: @group.id }}
      expect(response).to redirect_to(group_path(@group))
    end
  end

  describe "DELETE #destroy" do

    it "reduces the count of post by 1" do
      expect{
        delete :destroy, params: {id: @post}      
      }.to change(Post,:count).by(-1)
    end
    
    it "redirects to the show of group" do
      delete :destroy, params: {id: @post}
      expect(response).to redirect_to(group_path(@post.group))
    end
  end
end

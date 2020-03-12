require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  before do
    @membership = create(:member_ship)
    @group = @membership.group
    @user = @membership.user
    sign_in @user
  end

  describe "GET #show" do
    it "assigns the requested group to @group" do
      get :show, params: {id: @group}
      assigns(:group).should eq(@group)
    end

    it "assigns the requested posts in descinding order of creation time" do
      get :show, params: {id: @group}
      assigns(:posts).should eq(@group.posts.order(created_at: :desc))
    end

    it "renders the #show view" do
      get :show, params: {id: @group}
      response.should render_template :show
    end
  end

  describe "POST #create" do
    context "if group is valid" do
      it "increases the count of groups" do      
        expect {
          post :create, params: {group: {name: "Testing"}}
        }.to change(Group, :count).by(1)
      end

      it "redirects to the home page of current user" do
        post :create, params: {group: {name: "Testing"}}
        expect(response).to redirect_to(@user)
      end
    end

    context "if group is invalid" do
      it "does not increases the count of groups" do      
        expect {
          post :create, params: {group: {name: nil}}
        }.to change(Group, :count).by(0)
      end

      it "renders the new template of group" do
        post :create, params: {group: {name: nil}}
        response.should render_template :new
      end
    end
  end

  describe "DELETE #destroy" do
    it "reduces the count of group by 1" do
      expect{
        delete :destroy, params: {id: @group} 
      }.to change(Group,:count).by(-1)
    end
    
    it "redirects to the home page of current user" do
      delete :destroy, params: {id: @group}
      expect(response).to redirect_to(@user)
    end
  end
end

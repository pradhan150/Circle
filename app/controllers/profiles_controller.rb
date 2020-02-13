class ProfilesController < ApplicationController
  def create
    @user = User.find_by(params[:user_id])
    @profile = @user.profile.create
  end

  def show
    @profile = Profile.find(params[:id])
  end
end

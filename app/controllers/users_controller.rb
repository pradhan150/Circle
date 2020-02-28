class UsersController < ApplicationController
  def show
    @user = current_user
    @count = Invitation.where(receiver_id: current_user.id).count
  end 
end

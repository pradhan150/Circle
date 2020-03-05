class UsersController < ApplicationController  
   def show
    @invitation_count = current_user.received_invitations.count
  end 
end

class InvitationsController < ApplicationController
  def index
    @in_invitations = Invitation.where(receiver_id: current_user.id)
    @out_invitations = Invitation.where(sender_id: current_user.id)
  end

  def create
    begin
      Invitation.bulk_create(params[:receiver_ids], current_user, params[:group_id])
      flash[:notice] = 'your invitation has been sent successfully'
    rescue => e
      flash[:danger] = "Unable to create invitations due to #{e.message}"
    end

    redirect_to group_path(params[:group_id])
  end

  def accept
    @invitation = Invitation.find_by(id: params[:id])
    @member_ship = MemberShip.create(user_id:@invitation.receiver_id, group_id: @invitation.group_id)
    flash[:notice] = "invitation accepted successfully"
    @invitation.destroy

    redirect_to invitations_path
  end

  def destroy
    @invitation = Invitation.find_by(id: params[:id])
    @invitation.destroy

    redirect_to invitations_path
  end
end

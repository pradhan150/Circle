class MemberShipsController < ApplicationController
  before_action :load_membership

  def destroy
    @member_ship.role != nil && last_admin? ? flash[:warning] = "you must set anyother member admin before exiting the group" : @member_ship.destroy 

    redirect_to user_path(current_user)
  end

  def update
    if @member_ship.admin? && last_admin?
      flash[:warning] = "you must set anyother member admin before removing your admin status"
    else
      @member_ship.admin? ? @member_ship.update(role: nil) : @member_ship.update(role: 'admin')
    end

    redirect_to info_group_path(@member_ship.group_id)
  end

  private

  def last_admin?
    MemberShip.where(group_id: @member_ship.group_id, role: 'admin').count == 1
  end

  def load_membership
    @member_ship = MemberShip.find_by(id: params[:id])
  end
end

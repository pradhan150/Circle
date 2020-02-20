class GroupsController < ApplicationController
  def new
    @group = Group.new
    @member_ship = MemberShip.new
  end

  def show
    @group = Group.find_by(id:params[:id])
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      @member_ship = MemberShip.create(group_id: @group.id, user_id: current_user.id, role: 'admin')
      redirect_to current_user
    else
      render 'new'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end

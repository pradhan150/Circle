class GroupsController < ApplicationController 
  def new
    @group = Group.new
    @member_ship = MemberShip.new
  end

  def info
    @group = current_user.groups.find_by(id: params[:id])
    @member_ship = MemberShip.find_by(user_id: current_user.id, group_id: params[:id])
    @users = User.find_by_sql("select * from users where not id = #{current_user.id} and id not in (select receiver_id from invitations where group_id = #{@group.id}) and id not in (select user_id from member_ships where group_id = #{@group.id})")
    @current_members = @group.users
    # @current_members = User.find_by_sql("select * from users where id in (select user_id from member_ships where group_id = #{@group.id})")
  end

  def show
    @group = current_user.groups.find_by(id: params[:id])
    @posts = @group.posts.order(created_at: :desc)
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      @member_ship = MemberShip.create(group_id: @group.id, user_id: current_user.id, role: User::ROLES[:admin])
      redirect_to current_user
    else
      render 'new'
    end
  end

  def edit
    @group = current_user.groups.find_by(id: params[:id])
  end

  def update
  end

  def destroy
    @group = current_user.groups.find_by(id: params[:id])
    @group.destroy

    redirect_to user_path(current_user)
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end

class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def show
    @group = Group.find(params[:id])
    @today = Date.today
    @members = @group.users

  end

  def new
    @group = Group.new
    @users = User.all
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    user_ids = params["group"]["users"]
    user_ids.each do |e|
      @group.group_users.build(user_id: e)
    end
    @group.users << current_user
    if @group.save
      redirect_to groups_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to groups_path
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path
  end

  def leave
    # binding.pry
    @group = Group.find(params[:id])
    if @group.users.delete(current_user)
      redirect_to groups_path
    end
  end


  private
  def group_params
    params.require(:group).permit(:group_name)
  end
end

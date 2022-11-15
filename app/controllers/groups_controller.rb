class GroupsController < ApplicationController
  def index
    @groups = Group.all.order(group_name: 'asc')
  end

  def show
    @group = Group.find(params[:id])
    @today = Date.today
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
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

  private
  def group_params
    params.require(:group).permit(:group_name)
  end
end

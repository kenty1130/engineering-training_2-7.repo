class FootstepsController < ApplicationController
  def index
    @footsteps = Footstep.all.order(date: 'asc')
  end

  def new
    @footstep = Footstep.new
  end

  def create
    @footstep = Footstep.new(footstep_params)
    @footstep.user_id = current_user.id if current_user
    if @footstep.save
      redirect_to footsteps_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @footstep = Footstep.find(params[:id])
  end

  def update
    @footstep = Footstep.find(params[:id])
    if @footstep.update(footstep_params)
      redirect_to footsteps_path
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @footstep = Footstep.find(params[:id])
    @footstep.destroy
    redirect_to footsteps_path
  end

  private
    def footstep_params
      params.require(:footstep).permit(:date, :footstep)
    end

end

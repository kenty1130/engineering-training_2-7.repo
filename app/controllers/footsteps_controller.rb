class FootstepsController < ApplicationController
  def index
    @footsteps = Footstep.all.order(created_at: 'desc')
  end

  def new
    @footstep = Footstep.new
  end

  def create
    @footstep = Footstep.new(footstep_params)
    if @footstep.save
      redirect_to footsteps_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private
    def footstep_params
      params.require(:footstep).permit(:date)
    end

end

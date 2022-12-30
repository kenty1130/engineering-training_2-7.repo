class FavosController < ApplicationController
  def create
    @footstep_favo = Favo.new(user_id: current_user.id, footstep_id: params[:footstep_id])
    @footstep_favo.save
    redirect_to group_path(params[:group_id])
  end

  def destroy
    @footstep_favo = Favo.find_by(user_id: current_user.id, footstep_id: params[:footstep_id])
    @footstep_favo.destroy
    redirect_to group_path(params[:group_id])
  end
end

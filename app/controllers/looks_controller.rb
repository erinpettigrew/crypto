class LooksController < ApplicationController
  before_action :set_look, only: [:show, :update, :destroy]

  def show
  end




  private
  def set_look
    @look = Look.friendly.find(params[:id])
  end

  def look_params
    params.require(:look).permit(:title, :description, :user_id)
  end


end

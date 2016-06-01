class AvatarsController < ApplicationController
  before_action :set_avatar, only: [:show, :edit, :update, :destroy]
  before_action :set_user
  before_action :authenticate_user!

  def index
    @avatars = Avatar.all
  end

  def show
  end

  def new
    @avatar = Avatar.new
  end

  def edit
  end

  def create
    @avatar = Avatar.new(avatar_params)
    @avatar.user_id = current_user.id

    respond_to do |format|
      if @avatar.save
        format.html { redirect_to user_path(current_user), notice: 'Your photo was successfully created.' }
        format.json { render :show, status: :created, location: @avatar }
      else
        format.html { render :new }
        format.json { render json: @avatar.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @avatar.update(avatar_params)
        format.html { redirect_to user_path(current_user), notice: 'Your photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @avatar }
      else
        format.html { render :edit }
        format.json { render json: @avatar.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @avatar.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user), notice: 'Your photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_avatar
    @avatar = Avatar.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def avatar_params
    params.require(:avatar).permit(:image)
  end
end

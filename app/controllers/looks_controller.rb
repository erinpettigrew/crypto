class LooksController < ApplicationController
  before_action :set_look, only: [:show, :update, :destroy]
  before_action :authenticate_user!, except: [:show]

  def show
  end

  def new
    @look = Look.new
  end

  def create
    @look = Look.new(look_params)

    respond_to do |format|
      if @look.save
        format.html { redirect_to look_path(@look), notice: 'Your look was successfully created.' }
        format.json { render :show, status: :created, location: @look }
      else
        format.html { render :new }
        format.json { render json: @look.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @look.update(look_params)
        format.html { redirect_to look_path(@look), notice: 'Your look was successfully updated.' }
        format.json { render :show, status: :ok, location: @look }
      else
        format.html { render :edit }
        format.json { render json: @look.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @look.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user), notice: 'Your look was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
  def set_look
    @look = Look.friendly.find(params[:id])
  end

  def look_params
    params.require(:look).permit(:title, :description, :user_id, :image)
  end


end

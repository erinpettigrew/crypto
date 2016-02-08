class ThemesController < ApplicationController
 before_action :set_theme, only: [:show, :destroy]
 before_action :authenticate_user!
 before_action :check_user


  def new
  	@theme = Theme.new
  end

  def create
  	@theme = Theme.new(theme_params)

    respond_to do |format|
      if @theme.save
        format.html { redirect_to @theme, notice: 'Theme was successfully created.' }
        format.json { render :show, status: :created, location: @theme }
      else
        format.html { render :new }
        format.json { render json: @theme.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def index
  	@themes = Theme.all()
  end


  def destroy
  	@theme.destroy
  	  respond_to do |format|
      	format.html { redirect_to product_url, notice: 'This was successfully destroyed.' }
      	format.json { head :no_content }
      end
  end


private

  	def set_theme
      @theme = Theme.find(params[:id])
    end

    def theme_params
  	   params.require(:theme).permit(:name, :info)
    end

    def check_user
      unless current_user.admin?
        redirect_to root_url, alert: "Sorry, only admins can do that!"
      end
    end

end

class SitesController < ApplicationController
  before_action :set_product
  before_action :set_site
  before_action :authenticate_user!
  before_action :check_user

  def new
  	@site = Site.new
  end

  def create
  	@site = Site.new(site_params)

      respond_to do |format|
      if @site.save
        format.html { redirect_to sites_path, notice: 'Site was successfully created.' }
        format.json { render :show, status: :created, location: @site }
      else
        format.html { render :new }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
  	@sites = Site.order(name: :ASC)
  end

  def destroy
  end


private
  def site_params
    params.require(:site).permit(:name, :url)
  end

  def check_user
    unless current_user.admin?
      redirect_to root_url, alert: "Sorry, only admins can do that!"
    end
  end
end

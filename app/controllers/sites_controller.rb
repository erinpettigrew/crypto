class SitesController < ApplicationController
before_action :set_product
before_action :set_site
before_action :authenticate_user!

  def new
  	@site = Site.new()
  end

  def create
  	@site = Site.new(site_params)
  end

  def index
  	@sites = Site.order(name: :ASC)
  end

  def destroy

  end


private


def set_site

end


def set_product

end

 def site_params
  	params.require(:site).permit(:name, :url)
end

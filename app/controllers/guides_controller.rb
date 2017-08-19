class GuidesController < ApplicationController
  def index
    @exchanges = Exchange.where(ny_permitted: true)
  end
end

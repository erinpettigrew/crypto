class ExchangesController < ApplicationController
  before_action :set_exchange, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :check_user, except: [:index, :show, :search]

  def search
      @query = params[:search]
      @exchanges = Exchange.search(params[:search])
  end

  def new
    @exchange = Exchange.new
  end

  def create
    @exchange = Exchange.new(exchange_params)

    respond_to do |format|
      if @exchange.save
        format.html { redirect_to @exchange, notice: 'exchange was successfully created.' }
        format.json { render :show, status: :created, location: @exchange }
      else
        format.html { render :new }
        format.json { render json: @exchange.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @currencies = Exchange.all
  end

  def show
  end

  def update
    respond_to do |format|
      if @exchange.update(exchange_params)
        format.html { redirect_to @exchange, notice: 'exchange was successfully updated.' }
        format.json { render :show, status: :ok, location: @exchange }
      else
        format.html { render :edit }
        format.json { render json: @exchange.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @exchange.destroy
    respond_to do |format|
      format.html { redirect_to product_url, notice: 'This was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
  def set_exchange
    @exchange = Exchange.friendly.find(params[:id])
  end

  def exchange_params
    params.require(:exchange).permit(:name, :image, :about, :requirements, :location, :credit_card, :bank_transfer, :paypal)
  end

  def check_user
    unless current_user.admin?
      redirect_to root_url, alert: "Sorry, only admins can do that!"
    end
  end

end

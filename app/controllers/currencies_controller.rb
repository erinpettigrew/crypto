class CurrenciesController < ApplicationController
  before_action :set_currency, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :check_user, except: [:index, :show, :search]


  def search
    @query = params[:search]
    @currencies = Currency.search(params[:search])
  end

  def new
    @currency = Currency.new
  end

  def create
    @currency = Currency.new(currency_params)

    respond_to do |format|
      if @currency.save
        format.html { redirect_to @currency, notice: 'Currency was successfully created.' }
        format.json { render :show, status: :created, location: @currency }
      else
        format.html { render :new }
        format.json { render json: @currency.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @currencies = Currency.all
  end

  def show
  end

  def update
    respond_to do |format|
      if @currency.update(currency_params)
        format.html { redirect_to @currency, notice: 'Currency was successfully updated.' }
        format.json { render :show, status: :ok, location: @currency }
      else
        format.html { render :edit }
        format.json { render json: @currency.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @currency.destroy
    respond_to do |format|
      format.html { redirect_to product_url, notice: 'This was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
  def set_currency
    @currency = Currency.friendly.find(params[:id])
  end

  def currency_params
    params.require(:currency).permit(:name, :image, :ticker, :about)
  end

  def check_user
    unless current_user.admin?
      redirect_to root_url, alert: "Sorry, only admins can do that!"
    end
  end

end

class InvestorsController < ApplicationController
  before_action :set_investor, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :check_user

  def index
    @investors = Investor.all
  end

  def show
  end

  def new
    @investor = Investor.new
  end

  def edit
  end

  def create
    @investor = Investor.new(investor_params)

    respond_to do |format|
      if @investor.save
        format.html { redirect_to @investor, notice: 'investor was successfully created.' }
        format.json { render :show, status: :created, location: @investor }
      else
        format.html { render :new }
        format.json { render json: @investor.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @investor.update(investor_params)
        format.html { redirect_to @investor, notice: 'Investor was successfully updated.' }
        format.json { render :show, status: :ok, location: @investor }
      else
        format.html { render :edit }
        format.json { render json: @investor.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @investor.destroy
    respond_to do |format|
      format.html { redirect_to investors_url, notice: 'Investor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def investor_params
    params.require(:investor).permit(:name)
  end

  def set_investor
    @investor = Investor.friendly.find(params[:id])
  end

  def check_user
    unless current_user.admin?
      redirect_to root_url, alert: "Sorry, only admins can do that!"
    end
  end
end

class InvestorsController < ApplicationController
  before_action :set_investor, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :check_user

  def new
    @investor = Investor.new
  end

  def edit
  end

  def show
  end

  def create
    @Investor = Investor.new(investor_params)

    respond_to do |format|
      if @Investor.save
        format.html { redirect_to @Investor, notice: 'investor was successfully created.' }
        format.json { render :show, status: :created, location: @iInvestor }
      else
        format.html { render :new }
        format.json { render json: @Investor.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @Investor.update(investor_params)
        format.html { redirect_to @Investor, notice: 'Investor was successfully updated.' }
        format.json { render :show, status: :ok, location: @Investor }
      else
        format.html { render :edit }
        format.json { render json: @Investor.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @Investor.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Investor was successfully destroyed.' }
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

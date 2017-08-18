class InvestmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user

  def new
    @investment = Investment.new
  end

  def create
    @investment = Investment.new(investment_params)

    respond_to do |format|
      if @investment.save
        format.html { redirect_to @investment, notice: 'Investment was successfully created.' }
        format.json { render :show, status: :created, location: @investment }
      else
        format.html { render :new }
        format.json { render json: @investment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @investment.update(investment_params)
        format.html { redirect_to @investment, notice: 'Investment was successfully updated.' }
        format.json { render :show, status: :ok, location: @investment }
      else
        format.html { render :edit }
        format.json { render json: @investment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @investment.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Investment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def use_params
    params.require(:investment).permit(:exchange_id, :investor_id)
  end
end

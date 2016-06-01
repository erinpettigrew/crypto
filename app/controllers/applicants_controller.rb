class ApplicantsController < ApplicationController
  before_action :disable_nav
  before_action :disable_footer
  before_action :set_applicant, only: [:update, :destroy]
  before_action :check_user, only: [:index, :destroy]

  def index
    @applicants = Applicant.all
  end

  def new
    @applicant = Applicant.new
  end

  def edit
  end

  def create
    @applicant = Applicant.new(applicant_params)
    
    respond_to do |format|
      if @applicant.save
        format.html { redirect_to thanks_path}
        format.json { render :thanks, status: :created, location: @applicant }
      else
        format.html { render :new }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @applicant.update(applicant_params)
        format.html { redirect_to @applicant, notice: 'Applicant was successfully updated.' }
        format.json { render :thanks, status: :ok, location: @applicant }
      else
        format.html { render :edit }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @applicant.destroy
    respond_to do |format|
      format.html { redirect_to applicants_url, notice: 'Applicant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_applicant
    @applicant = Applicant.find(params[:id])
  end

  def applicant_params
    params.require(:applicant).permit(:email, :info)
  end

  def check_user
    unless current_user.admin?
      redirect_to root_url, alert: "Sorry, only admins can do that!"
    end
  end
end

class SkinTypesController < ApplicationController
	before_action :check_user
	before_action :set_skin_type, only: [:show, :edit, :destroy, :update]


	def index
		@skin_types = SkinType.all
	end

	def show
	end


	def new
		@skin_type = SkinType.new
	end


	def create
		@skin_type = SkinType.new(skin_type_params)

		respond_to do |format|
			if @skin_type.save
				format.html { redirect_to skin_types_path, notice: 'Skin type was successfully created.' }
				format.json { render :index, status: :created, location: @skin_type }
			else
				format.html { render :new }
				format.json { render json: @skin_type.errors, status: :unprocessable_entity }
			end
		end
	end

	def edit
	end


	def update
		respond_to do |format|
			if @skin_type.update(skin_type_params)
				format.html { redirect_to @skin_type, notice: 'Skin type was successfully updated.' }
				format.json { render :index, status: :ok, location: @skin_type }
			else
				format.html { render :edit }
				format.json { render json: @skin_type.errors, status: :unprocessable_entity }
			end
		end

	end


	def destroy
		@skin_type.destroy
		respond_to do |format|
			format.html { redirect_to root_url, notice: 'This was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_skin_type
		@skin_type = SkinType.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def skin_type_params
		params.require(:skin_type).permit(:name)
	end

	def check_user
		unless current_user.admin?
			redirect_to root_url, alert: "Sorry, only admins can do that!"
		end
	end
end

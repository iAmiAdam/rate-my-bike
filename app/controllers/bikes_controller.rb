class BikesController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy]
	before_action :correct_user, only: [:edit]

	def index
	end

	def show
	end

	def new
		@bike = Bike.new
	end

	def create
		@bike = current_user.bikes.build(bike_params)
		if @bike.save
			redirect_to root_url
		end
	end

	def edit
		@bike = Bike.find_by(params[:id])
	end

	def update
		@bike = Bike.find_by(params[:id])
		if @bike.update_attributes(bike_params) then
			redirect_to @bike
		else
			render 'edit'
		end
	end


	private

		def bike_params
			params.require(:bike).permit(:make, :model, :name, :description, :category)
		end

		def correct_user
			redirect_to root_url unless current_user?(@bike.user_id)
		end
end
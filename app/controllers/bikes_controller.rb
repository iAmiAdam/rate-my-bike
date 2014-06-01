class BikesController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy]

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


	private

		def bike_params
			params_require(:bike).permit(:make, :model, :name, :description, :category)
		end
end

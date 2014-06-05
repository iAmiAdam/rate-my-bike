class BikesController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy]
	before_action :correct_user, only: [:edit]

	def index
	end

	def show
		@bike = Bike.find_by(params[:id])
		@user = User.find_by(@bike.user_id)
		@comments = @bike.comments
		@comment = current_user.comments.build
		@rating = Rating.new
		@score = 0 
		@bike.ratings.each do |f|
			@score += @bike.ratings[score]
		end
		@score = score / @bike.ratings.count
	end

	def new
		@bike = Bike.new
	end

	def create
		@bike = current_user.bikes.build(bike_params)
		if @bike.save
			redirect_to @bike
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
			params.require(:bike).permit(:make, :model, :name, :description, :category, :picture)
		end

		def correct_user
			redirect_to root_url unless current_user?(@bike.user_id)
		end
end
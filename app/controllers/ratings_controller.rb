class RatingsController < ApplicationController

	def create
		if rated?(current_user.id, params[:bike_id]) then 
			redirect_to bike_path(params[:bike_id] 
		else 
			current_user.ratings.build(rating_params)
			@bike = bike.find_by(params[:bike_id])
			@bike.rating += params[:rating]
			@bike.rating = @bike.rating / 2
			@bike.update_attribute(rating: @bike.rating)
			redirect_to bike_path(params[:bike_id])
		end
	end

	private

		def rating_params
			params.require(:rating).permit(:bike_id, :rating)
		end
end

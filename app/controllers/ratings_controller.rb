class RatingsController < ApplicationController

	def create
		if Rating.where(user_id: current_user.id, bike_id: params[:bike_id], created_at: Time.now) === true then 
			redirect_to bike_path(params[:bike_id]) 
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
			params.permit(:bike_id, :score)
		end
end

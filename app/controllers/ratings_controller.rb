class RatingsController < ApplicationController

	def create
		if Rating.find(:all, conditions: { created_at: Time.now.day, bike_id: params[:rating][:bike_id]} ) === true then 
			redirect_to bike_path(params[:rating][:bike_id]) 
		else 
			@rating = current_user.ratings.build(rating_params)
			@rating.save
			@bike = Bike.find_by(params[:rating][:bike_id])
			@bike.rating += params[:rating][:score].to_i
			@bike.rating = @bike.rating / 2
			@bike.update_attribute(:rating, @bike.rating)
			redirect_to bike_path(params[:rating][:bike_id])
		end
	end

	private
		def rating_params
			params.require(:rating).permit(:bike_id, :score)
		end
end

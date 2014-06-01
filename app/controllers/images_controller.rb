class ImagesController < ApplicationController

	def new
		@image = Image.new
	end

	def create
		if image_params.user_id then
			current_user.images.build(image_params)
		else
			current_user.bikes.images.build(image_params)
		end
	end

	def edit
		@image = Image.find_by(params[:id])
	end

	def update
		@image = Image.find_by(params[:id])
		if @image.update_attributes(image_params) then
			redirect_to root_url #needs changing
		else
			render 'edit'
		end
	end

	def destroy
	end

	private
		def image_params
			params.require(:image).permit(:file_name)
		end
end

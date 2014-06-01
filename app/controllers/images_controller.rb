class ImagesController < ApplicationController

	def new
		@image = Image.new
	end

	def create
		if image_params.user_id
			current_user.images.build(image_params)
		else
			current_user.bike.images.build(image_params)
		end
	end

	def destroy
	end

	private
		def image_params
			params.require(:image).permit(:file_name)
		end
end

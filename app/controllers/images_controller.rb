class ImagesController < ApplicationController

	def new
		current_user.image.build
	end

	def update 
		
	end

	def destroy
	end

	private
		def image_params
			params.require(:image).permit(:upload, :avatar)
		end

		def random_name
			Digest::SHA1.hexdigest(Time.now.to_s)
		end
end

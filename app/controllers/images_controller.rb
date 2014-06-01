class ImagesController < ApplicationController

	private
		def image_params
			params.require(:image).permit(:file_name)
end

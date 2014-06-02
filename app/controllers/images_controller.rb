class ImagesController < ApplicationController

	def new
		Image.avatarSave(params(:image))
	end

	def update 
		uploaded = params[:upload]
		File.open(Rails.root.join('public', 'assets', 'images', 'avatars', uploaded.original_filename), 'wb') do |file|
			file.write(uploaded.read)
		end
		current_user.update_attribute(:avatar, uploaded.original_filename)
	end

	def destroy
	end

	private
		def image_params
			params.require(:image).permit(:file_name)
		end


end

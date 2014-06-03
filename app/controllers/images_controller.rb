class ImagesController < ApplicationController

	def new
		Image.avatarSave(params(:image))
	end

	def update 
		directory = "public/assets/images/avatars"

		if !current_user.avatar.empty? then
			File.delete(directory + "/" + current_user.avatar)
		end

		uploaded = params[:upload]
		newName = random_name

		File.open((directory + "/" + uploaded.original_filename), 'wb') do |f|
			f.write(uploaded.read)
		end

		extension = File.extname(directory + "/" + uploaded.original_filename)
		File.rename(directory + "/" + uploaded.original_filename, directory + "/" + newName + File.extname(directory + "/" + uploaded.original_filename))
		current_user.images.build(image_params)
		redirect_to settings_account_path
	end

	def destroy
	end

	private
		def image_params
			params.require(:image).permit(:photo)
		end

		def random_name
			Digest::SHA1.hexdigest(Time.now.to_s)
		end
end

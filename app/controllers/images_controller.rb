class ImagesController < ApplicationController

	def new
		Image.avatarSave(params(:image))
	end

	def update 
		
		uploaded = params[:upload]
		newName = random_name
		directory = "public/assets/images/avatars"
		File.open(Rails.root.join('public', 'assets', 'images', 'avatars', uploaded.original_filename), 'wb') do |f|
			f.write(uploaded.read)
		end
		extension = File.extname(directory + "/" + uploaded.original_filename)
		File.rename(directory + "/" + uploaded.original_filename, directory + "/" + newName + File.extname(directory + "/" + uploaded.original_filename))
		current_user.update_attribute(:avatar, "#{newName}#{extension}")
	end

	def destroy
	end

	private
		def image_params
			params.require(:image).permit(:file_name)
		end

		def random_name
			Digest::SHA1.hexdigest(Time.now.to_s)
		end
end

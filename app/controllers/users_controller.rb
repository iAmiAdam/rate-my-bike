class UsersController < ApplicationController
	
	def index
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save then
			redirect_to root_url
		else 
			render 'new'
		end
	end


	def destroy
	end

	private

		def user_params
			params.require(:user).permit(:username, :email, :password, :password_confirmation)
		end
end
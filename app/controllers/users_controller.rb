class UsersController < ApplicationController
	
	def index
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		@user.save
		redirect_to root_url
	end


	def destroy
	end

	private

		def user_params
			params.require(:user).permit(:username, :email, :password, :password_confirmation)
		end
end
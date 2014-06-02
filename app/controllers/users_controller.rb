class UsersController < ApplicationController
	before_action :correct_user, only: [:destroy]
	before_action :already_signed_in, only: [:create, :new]
	
	def index
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save then
			sign_in @user
			redirect_to root_url
		else 
			render 'new'
		end
	end

	def show
		@user = User.ci_find('username', params[:username])
	end

	def edit
		@user = current_user 
	end

	def update
		@user = current_user
		if @user.update_attributes(user_params)
			redirect_to "/#{current_user.username}"
		else
			render 'edit'
		end
	end

	def destroy
		User.find_by(:username, params[:username])
		flash[:success] = "Account deleted."
		redirect_to root_url
	end

	private

		def user_params
			params.require(:user).permit(:username, :email, :password, :password_confirmation, :bio, :avatar)
		end

		def correct_user
			# Search for a user via the provided username
			@user = User.ci_find('username', params[:username])
			# Redirect the user away unless they are actually the current user
			redirect_to(root_url) unless current_user?(@user)
		end

		def already_signed_in
			if signed_in?
				# Redirects user from sign in if they're already signed in
				redirect_to root_url
			end
		end
end
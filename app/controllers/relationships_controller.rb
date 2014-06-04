class RelationshipsController < ApplicationController

	def create
		@user = User.find(params[:relationship][:friend_id])
		current_user.add!(@user)
		redirect_to "/#{@user.username}"
	end

	def destroy
		@user = Relationship.find(params[:id]).friend
		current_user.remove!(@user)
		redirect_to "/#{@user.username}"
	end
end

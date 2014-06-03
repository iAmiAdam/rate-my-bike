class CommentsController < ApplicationController

	def new
		@comment = Comment.new
	end

	def create
		@comment = current_user.comments.build(comment_params)
		@comment.save
		redirect_to bike_path(comment_params[:bike_id])
	end

	def destroy
	end

	private

		def comment_params
			params.require(:comment).permit(:content, :bike_id)
		end
end

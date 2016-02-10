class CommentsController < ApplicationController
	def create
		@postquote = Postquote.find_by(id: params[:postquote_id])
		create_comment(@postquote)
	end

	private
	def create_comment(postquote)
		@comment = @postquote.comments.create(comment_params)
		if @comment.save
			flash[:notice] = "Thank you for submitting a comment"
			
		else
			flash[:alert] = "Sorry, your comment failed to save, please try again"
		end
		redirect_to postquote_path(@postquote.id)
	end
	def comment_params
		params.require(:comment).permit(:content).merge(user: current_user)
	end
end
class PostquotesController < ApplicationController
	def index
		@postquotes = Postquote.all
	end

	def new
		@postquote = Postquote.new
	end

	def create
		@new_postquote = Postquote.new(postquote_params)
		if @new_postquote.save
			flash[:notice] = "Thanks for submitting a quote!"
			redirect_to postquote_path(@new_postquote)
		else
			flash[:error] = "Please try again"
			redirect_to new_postquote_path
		end
	end

	def edit
		@postquote = Postquote.find_by(id: params[:id])
	end

	def update
		@postquote = Postquote.find_by(id: params[:id])
		if @postquote.update(postquote_params)
			flash[:notice] = 'Update to your quote was saved'
			redirect_to postquote_path(@postquote)
		else 	
			flash[:error] = "Please try again"
			render :edit
		end
	end

	def destroy
		@postquote = Postquote.find_by(id: params[:id])
		@postquote.destroy
		redirect_to '/'
	end

	def show
		@postquote = Postquote.find_by(id: params[:id])
	end

	private
	def postquote_params
 		params.require(:postquote).permit(:title, :content).merge(creator: current_user)
	end
end
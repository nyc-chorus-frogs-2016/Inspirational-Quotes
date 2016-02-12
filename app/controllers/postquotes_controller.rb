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
		load_wallpaper
		@postquote = Postquote.find_by(id: params[:id])
		@comment = Comment.new
	end

	private



	def postquote_params
		params.require(:postquote).permit(:title, :content).merge(creator: current_user)
	end

	def load_wallpaper
		url = "http://wall.alphacoders.com/api2.0/get.php?auth=27ab91f0734eebf75a719bb7ab53d19e&method=category&id=2&info_level=2"
		response = HTTParty.get(url)
		parsed = response.parsed_response
		@wallpaper_url = parsed["wallpapers"].sample["url_image"]
	end
end
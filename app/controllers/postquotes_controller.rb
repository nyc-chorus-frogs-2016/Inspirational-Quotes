class PostquotesController < ApplicationController
	def index
	  @postquotes = Postquote.all
	end

	def create

	end

	def new

	end

	def edit

	end

	def update

	end

	def show
		@postquote = Postquote.find_by(id: params[:id])
	end

end
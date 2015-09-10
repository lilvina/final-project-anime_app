class AnimesController < ApplicationController
	# before_action :authorize

	def index
	end

	def search
		puts "Searching.."
		genre = params[:genre]
		redirect_to "/anime/#{genre}"
	end

	def genre
		genre = params[:genre]
		@results = Anime.where(genre: genre)
	end
end

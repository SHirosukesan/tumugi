class FavoritesController < ApplicationController
		# before_action :set_user
	def create
    	@favorite = current_user.favorites.new(user_id: @book.id)
    	@favorite.save
	end

	def destroy
	     @favorite = current_user.favorites.find_by(user_id: @book.id)
	     @favorite.destroy
	end
	private
	def set_book
	    @book = Book.find(params[:user_id])
	end
end

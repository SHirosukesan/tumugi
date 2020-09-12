class FavoritesController < ApplicationController
		# before_action :set_user
	def create
    	@favorite = current_user.favorites.new(user_id: @user.id)
    	@favorite.save
	end

	def destroy
	     @favorite = current_user.favorites.find_by(user_id: @user.id)
	     @favorite.destroy
	end
	private
	def set_user
	    @user = User.find(params[:user_id])
	end
end

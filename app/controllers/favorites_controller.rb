class FavoritesController < ApplicationController
		before_action :set_user
	def create
    	@favorite = Favorite.new(user_id: @user.id, paublisher_id: @publisher.id)
    	@favorite.save
	end

	def destroy
	     @favorite = Favorite.find_by(user_id: @user.id,publisher_id: @publisher.id)
	     @favorite.destroy
	end
	private
	def set_user
	   @user = User.find(params[:user_id])
	end

	def set_publisher
		@paublisher = Publisher.find(params[:publisher_id])
	end
end

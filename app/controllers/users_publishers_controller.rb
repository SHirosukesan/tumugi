class UsersPublishersController < ApplicationController
  def match
    if params[:follower_permission]
      current_user.match(params[:user_id],params[:publisher_id],params[:follower_permission])
      redirect_to publisher_path(params[:publisher_id])
    end
  end

   def unmatch
      current_user.unmatch(params[:user_id], params[:publisher_id])
     redirect_to publisher_path(params[:publisher_id])
   end
# ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー↓publisher側ーーーーーーーーーーー
  def publisher_match
    if params[:follower_permission]
      current_publisher.match(params[:user_id],params[:publisher_id],params[:follower_permission])
      redirect_to user_path(params[:user_id])
    end
  end

  def publisher_unmatch
      current_publisher.unmatch(params[:user_id], params[:publisher_id])
      redirect_to user_path(params[:user_id])
  end
end


  # コメ後々共通化したほうが良い

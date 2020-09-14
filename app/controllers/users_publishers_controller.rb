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
  # publisherがフォローするとき
#   def publisher_match
#     if params[:follower_permission]
#       current_publisher.match(params[:user_id],params[:publisher_id],params[:follower_permission])
#       redirect_to user_path(params[:user_id])
#     end

#     @ff = false #片思い
#     if Users_publishers.exists?(follower_id: params[:user_id], followed_id:params[:publisher_id])
#       @ff = true #相互フォロー状態
#       if (ChatRooms.exists(publisher_id: current_publisher, user_id: current_user.id))
#         # 既にチャットルームが存在しているならばそのチャットテーブルを取得
#         @chat = ChatRooms.find_by(publisher_id: current_publisher, user_id:current_user.id)
#       else
#         # 存在しなければチャットルームを新規作成
#         @chat = ChatRooms.new
#         @chat.publisher_id = params[:publisher_id]
#         @chat.user_id = params[:user_id]
#         @chat.save
#       end
#     end

#   end

#   def publisher_unmatch
#       current_publisher.unmatch(params[:user_id], params[:publisher_id])
#       redirect_to user_path(params[:user_id])
#   end
# end


  # コメ後々共通化したほうが良い

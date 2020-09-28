class RoomsController < ApplicationController
  def create
  	@room = Room.create
    @entry1 = Entry.create(room_id: @room.id, user_id: current_user.id)
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id))
    redirect_to "/rooms/#{@room.id}"
  end

  def show
  	@room = Room.find(params[:id])
    if Entry.where(user_id: current_user.id,room_id: @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @entries = @room.entries
    else
      redirect_back(fallback_location: root_path)
    end
   end

  def index
     user_all = current_user.following_user & current_user.follower_user
     current_user_entries = Entry.where(user_id: current_user.id)
     # ユーザの持っているエントリーidを持ってきている
     follower_entries = Entry.where(user_id: user_all.map{|n| n.id})
     # 相互フォローしている相手のエントリーidを全て持ってきている
     logger.debug("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
     # テスト
     logger.debug(current_user_entries.map{|n| n.room_id})
     logger.debug(follower_entries.map{|n| n.room_id})
     logger.debug(current_user_entries.map{|n| n.room_id} & follower_entries.map{|n| n.room_id})
     logger.debug(Entry.all.map{|n| "user_id: #{n.user_id}, room_id: #{n.room_id}\n"})
     logger.debug("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
     # テスト
     @rooms = Room.where(id: current_user_entries.map{|n| n.room_id} & follower_entries.map{|n| n.room_id})
     # ログインしているuserのroom_id&相互フォローの相手のroom_id
     # &積集合になる
  end
  def room
  	@user = User.find(params[current_user])
  	@publisher = Publisher.find(params[current_publisher])
  end
end

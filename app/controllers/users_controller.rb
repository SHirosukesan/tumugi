class UsersController < ApplicationController
  def home
  end

  def index
    @publishers = Publisher.all
  end

  def create
  end

  def show
    @users =User.all
    #---------ニックネームとか出すよう-----------------------------------------------
    @user=User.find(params[:id])
    #-------------ひとりひとりの情報を持ってくる--------------------------
    #------------上edit_pageにも使っている,下でも使っているDm機能で------------------------------------------
    @currentUserEntry=Entry.where(user_id: current_user.id)
    #現在ログインしているユーザー-------------------------whereで条件に合う人を全て持ってきている-----------------------------------------------------
    @userEntry=Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def edit
    @user=User.find(current_user.id)
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  def follow_index
    @user = User.find(current_user.id)
  end

  def destroy
  end

  def edit_nickname
    @user = User.find(current_user.id)
  end

  def edit_age
    @user = User.find(current_user.id)
  end

  def edit_profile
    @user = User.find(current_user.id)
  end

  def edit_number
    @user = User.find(current_user.id)
  end

  def edit_address
    @user = User.find(current_user.id)
  end

  def edit_postalcode
    @user = User.find(current_user.id)
  end

  def edit_firstname_lastname
    @user = User.find(current_user.id)
  end

  def edit_prefecture
    @user = User.find(current_user.id)
  end

  def hide
        @user = User.find(params[:id])
        #is_deletedカラムにフラグを立てる(defaultはfalse)
        @user.update(is_withdrawal: true)
        #ログアウトさせる
        reset_session
        flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
        redirect_to root_path
    end
  def search
  end

  def following_index
    @user = User.find(current_user.id)
  end
  def follower_index
    @user = User.find(current_user.id)
  end

  private

  def user_params
    params.require(:user).permit(:nickname,:prefecture,:name,:profile,:firstname,:lastname,:address,:postalcode,:is_withdrawal,:number,:group_id,:age,:competence,images_images:[])
  end
end
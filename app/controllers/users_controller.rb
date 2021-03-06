class UsersController < ApplicationController
  def home
  end

  def index
    @publishers = Publisher.all
  end

  def create
  end

  def show
    if user_signed_in?
      @users =User.all
      #---------ニックネームとか出すよう-----------------------------------------------
      @user=User.find(params[:id])
      #-------------ひとりひとりの情報を持ってくる--------------------------
      #------------上edit_pageにも使っている,下でも使っているDm機能で------------------------------------------
      @currentUserEntry=Entry.where(user_id: current_user.id)
      #現在ログインしているユーザー-------------------------whereで条件に合う人を全て持ってきている-----------------------------------------------------
      @userEntry=Entry.where(user_id: @user.id)
      @room = Room.new
      @entry = Entry.new
      # Relationships.where(follower_id: current_user.id)
      @user_all = current_user.following_user & current_user.follower_user
      # unless @user.id == current_user.id
      #   @currentUserEntry.each do |cu|
      #     @userEntry.each do |u|
      #       if cu.room_id == u.room_id then
      #         @isRoom = true
      #         @roomId = cu.room_id
      #       end
      #     end
      #   if @isRoom
      #   else
      #     @room = Room.new
      #     @entry = Entry.new
      #   end
      # end
      # end
    end
   if publisher_signed_in?
    @users =User.all
    @user=User.find(params[:id])
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
    @users = User.search(params[:search])
  end

  def following
    @user = User.find(current_user.id)
  end

  def by_follower
    @user = User.find(current_user.id)
  end

  def new_guest
    user = User.find_or_create_by!(email: "test1@test.com") do |user|
      user.password = "123456"
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
    sign_in user
    redirect_to users_path, notice: "ゲストユーザーとしてログインしました。"
  end

  private

  def user_params
    params.require(:user).permit(:nickname,:prefecture,:name,:profile,:firstname,:lastname,:address,:postalcode,:is_withdrawal,:number,:group_id,:age,:competence,images_images:[])
  end
end
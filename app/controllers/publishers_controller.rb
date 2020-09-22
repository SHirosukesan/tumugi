class PublishersController < ApplicationController
  def index
    @users = User.all
  end
  def home
  end
  def create
    # ---------------------通知機能で作成------------------
     @user = User.find(params[:following_id])
      current_user.follow(@user)
      #通知の作成
      @user.create_notification_follow!(current_user)
  end
  def show
    @publishers = Publisher.all
     #----------------画像の表示-------------------------------
    @publisher=Publisher.find(params[:id])
  end
  def edit
    @publisher = Publisher.find(current_publisher.id)
  end
  def update
  end
  def destroy
  end
end


# ※userの情報も持ってこれる
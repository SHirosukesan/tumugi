class PublishersController < ApplicationController
  def index
    @users = User.all
  end
  def home
  end
  def create
    @user = User.find(params[:users_publishser][:following_id])
    current_user.follow!(@user)
    # ここから
    @user.create_notification_follow!(current_user)
    # ここまで
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
  def show
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
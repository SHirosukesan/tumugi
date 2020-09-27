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
    @publisher = Publisher.find(params[:id])
    @publisher.update(publisher_params)
    redirect_to publisher_path(@publisher.id)
  end

  def destroy
  end

  def following_index
  	@users = User.all
  end

  
  private

  def publisher_params
    params.require(:publisher).permit(:firstname, :lastname, :address, :postalcode, :nicname, :status, :number, :profile, :age, :competence, :company_name, :name, publisher_images_publisher_images:[])
  end
end
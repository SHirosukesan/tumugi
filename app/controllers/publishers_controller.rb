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
    redirect_to edit_publisher_path(@publisher.id)
  end

  def destroy
  end

  def following_index
  	@users = User.all
  end

  def edit_company_name
    @publisher = Publisher.find(current_publisher.id)
  end

  def edit_age
    @publisher = Publisher.find(current_publisher.id)
  end

  def edit_profile
    @publisher = Publisher.find(current_publisher.id)
  end

  def edit_number
    @publisher = Publisher.find(current_publisher.id)
  end

  def edit_address
   @publisher = Publisher.find(current_publisher.id)
  end

  def edit_postalcode
    @publisher = Publisher.find(current_publisher.id)
  end

  def edit_firstname_lastname
    @publisher = Publisher.find(current_publisher.id)
  end

  def edit_prefecture
    @publisher = Publisher.find(current_publisher.id)
  end




  private

  def publisher_params
    params.require(:publisher).permit(:firstname, :lastname, :address, :postalcode, :nicname, :status, :number, :profile, :age, :competence, :company_name, :name, publisher_images_publisher_images:[])
  end
end
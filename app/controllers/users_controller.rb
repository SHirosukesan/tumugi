class UsersController < ApplicationController
  def home
  end

  def index
  end

  def create
  end

  def show
    @user=User.find(params[:id])
  end

  def edit
    @user=User.find(current_user.id)
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to edit_user_path(@user.id)
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
  private

  def user_params
    params.require(:user).permit(:nickname,:prefecture,:name,:profile,:firstname,:lastname,:address,:postalcode,:is_withdrawal,:number,:group_id,:age,:competence,images_images:[])
  end
end
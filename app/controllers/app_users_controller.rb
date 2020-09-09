class AppUsersController < ApplicationController
  def create
    binding.pry
    @user = User.new(user_params)
    @user.save
    redirect_to user_path
  end

  private

  def user_params
    params.require(:user).permit(:nickname,:name,:profile,:firstname,:lastname,:address,:postalcode,:is_withdrawal,:number,:group_id,:age,:competence,images_images:[])
  end
end
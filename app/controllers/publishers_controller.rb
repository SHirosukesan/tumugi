class PublishersController < ApplicationController
  def index
    @users = User.all
  end
  def home
  end
  def create
  end
  def show
    @publisher=Publisher.find(params[:id])
  end
  def edit
  end
  def update
  end
  def destroy
  end
end
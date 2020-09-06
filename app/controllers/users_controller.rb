class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @tweets = Tweet.where(user_id: @user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit, notice: 'error'
    end
  end

  def confirm
  end

  private
  def user_params
    params.require(:user).permit(:name, :image, :introduction, :history, :favorite_alcohol)
  end
end

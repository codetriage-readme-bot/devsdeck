class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
    @cards = @user.latest_cards
    @liked = @user.latest_likes
  end

  def update
    @user.update(user_params)
    redirect_to action: 'show', id: @user.id
  end

  def edit
  end

  private

  def set_user
    @user = User.find(params[:id] || params[:user_id])
  end

  def user_params
    params.require(:user).permit(:name, :description)
  end
end

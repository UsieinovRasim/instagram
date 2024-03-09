class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @posts = @user.posts.order(:id)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: 'Профиль сохранен'
    else
      render 'edit'
    end
  end

  private

  def set_user
    @user = params[:id] ? User.find(params[:id]) : current_user
  end

  def user_params
    params.require(:user).permit(:avatar, :website, :about_myself, :gender)
  end
end

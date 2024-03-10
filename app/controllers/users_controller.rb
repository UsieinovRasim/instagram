class UsersController < ApplicationController
  before_action :set_user#, only: [:show, :edit, :update]
  before_action :authenticate_user!

  def show
    @posts = @user.posts.order(:id)
  end

  def follow
    current_user.send_follow_request_to(@user)
    @user.accept_follow_request_of(current_user)
    redirect_to user_path(@user)
  end

  def unfollow
    current_user.unfollow(@user)
    redirect_to user_path(@user)
  end

  def accept
    current_user.accept_follow_request_of(@user)
    redirect_to user_path(@user)
  end

  def decline
    current_user.decline_follow_request_of(@user)
    redirect_to user_path(@user)
  end

  def cancel
    current_user.remove_follow_request_for(@user)
    redirect_to user_path(@user)
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

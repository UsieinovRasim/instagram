class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    return if set_user_id.blank?

    @user = User.find(set_user_id)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to root_path, notice: 'Профиль сохранен'
    else
      render 'edit'
    end
  end

  private

  def set_user_id
    params[:id] || current_user&.id
  end

  def user_params
    params.require(:user).permit(:website, :about_myself, :gender)
  end
end

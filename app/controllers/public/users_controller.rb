class Public::UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])

  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(current_user)
  end

  def unsubscribe
  end

  private

  def user_params
     params.require(:user).permit(:email, :name, :introduction)
  end
end

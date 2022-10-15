class Public::UsersController < ApplicationController

   before_action :ensure_guest_user, only: [:show, :edit]
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

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end
end

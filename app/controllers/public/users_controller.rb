class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]
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
    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      render "edit"
    end
  end


  def withdrawal
    @user = current_user
    # is_validカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_valid: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
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

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
       redirect_to menus_path
    end
  end
end

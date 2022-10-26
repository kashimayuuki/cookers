class Public::FavoritesController < ApplicationController

  before_action :set_menu, except: [:index] #exceptは覗く時に活用
  before_action :authenticate_user!   # ログイン中のユーザーのみに許可（未ログインなら、ログイン画面へ移動）
  before_action :ensure_correct_user, only: [:create, :destroy]

  def index
    @favorites = current_user.favorites.page(params[:page]).per(12)
  end

  # お気に入り登録
  def create
    if @menu.user_id != current_user.id   # 投稿者本人以外に限定
      @favorite = Favorite.create(user_id: current_user.id, menu_id: @menu.id)
      @favorite.save
      # redirect_to menu_path(params[:menu_id]) 非同期通信の設定
    end
  end

  # お気に入り削除
  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, menu_id: @menu.id)
    @favorite.destroy
    # redirect_to menu_path(params[:menu_id]) 非同期通信設定
  end

  private

  def set_menu
    @menu = Menu.find(params[:menu_id])
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
       redirect_to menus_path
    end
  end
end

class Public::MenusController < ApplicationController
  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.user_id = current_user.id
    @menu.save
    redirect_to menu_path(@menu.id)
  end

  def index
    @genres = Genre.all
    #ジャンルを選択したとき
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @menus = @genre.menus.page(params[:page]).per(12)
    else #ジャンル選択していない時
      @menus = Menu.all.page(params[:page]).per(12)
    end
  end

  def show
    @menu = Menu.find(params[:id])

    favorites = Favorite.where(user_id: current_user.id).pluck(:menu_id)  # ログイン中のユーザーのお気に入りのmenu_idカラムを取得
    @favorite_list = Menu.find(favorites)     # menusテーブルから、お気に入り登録済みのレコードを取得
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    @menu = Menu.find(params[:id])
    @menu.update(menu_params)
    redirect_to menu_path(@menu)
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    redirect_to menus_path(@menu)
  end

  private

  def menu_params
    params.require(:menu).permit(:title, :body, :image, :genre_id)
  end
end

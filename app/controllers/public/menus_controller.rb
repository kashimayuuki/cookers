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
    @all_ranks = Menu.find(Favorite.group(:menu_id).order('count(menu_id) desc').limit(3).pluck(:menu_id))
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

    @comments = @menu.comments  #投稿詳細に関連付けてあるコメントを全取得
    @comment = current_user.comments.new  #投稿詳細画面でコメントの投稿を行うので、formのパラメータ用にCommentオブジェクトを取得

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

  def search
    @menus = Menu.search(params[:keyword]).page(params[:page]).per(12)
    @keyword = params[:keyword]
    @genres = Genre.all
    render "index"
  end

  private

  def menu_params
    params.require(:menu).permit(:title, :body, :image, :genre_id)
  end
end

class Public::MenusController < ApplicationController
  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.save
    redirect_to menu_path(@menu.id)
  end

  def index
    @menus = Menu.all.page(params[:page]).per(10)
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def edit
  end

  private

  def menu_params
    params.require(:menu).permit(:title, :body, :image, :genre_id)
  end
end

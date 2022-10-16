class Public::HomesController < ApplicationController
  def top
    @all_ranks = Menu.find(Favorite.group(:menu_id).order('count(menu_id) desc').limit(3).pluck(:menu_id))
    @menus = Menu.all
  end

  def about
  end
end

class Admin::HomesController < ApplicationController
  def top
    @menus = Menu.all
  end
end

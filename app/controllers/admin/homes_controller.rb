class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    @menus = Menu.all
  end
end

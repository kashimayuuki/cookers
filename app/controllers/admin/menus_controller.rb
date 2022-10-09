class Admin::MenusController < ApplicationController
  def show
    @menu = Menu.find(params[:id])
  end
end

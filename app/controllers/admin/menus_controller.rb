class Admin::MenusController < ApplicationController
  before_action :authenticate_admin!
  def show
    @menu = Menu.find(params[:id])
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    redirect_to admin_root_path
  end
end

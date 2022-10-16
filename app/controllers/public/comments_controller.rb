class Public::CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @menu = Menu.find(params[:menu_id])
    @comment = current_user.comments.new(comment_params)
    @comment.menu = @menu
    @comment.user_id = current_user.id
    @comment.save
  end

  def destroy
    @menu = Menu.find(params[:menu_id])
    @comment = @menu.comments.find(params[:id])  #1対多の関係で記載
    @comment.destroy
  end


  private
  def comment_params
    params.require(:comment).permit(:comment, :menu_id)  #formにてmenu_idパラメータを送信して、コメントへmenu_idを格納するようにする必要がある。
  end
end

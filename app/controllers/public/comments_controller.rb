class Public::CommentsController < ApplicationController
  def create
    menu = Menu.find(params[:menu_id])
    @comment = current_user.comments.new(comment_params)
    @comment.menu = menu
    @comment.user_id = current_user.id
    @comment.save
    # redirect_to menu_path(menu)
  end

  def destroy
    # binding.pry
    menu = Menu.find(params[:menu_id])
    @comment = menu.comments.find(params[:id])  #1対多の関係で記載
    # @comment.menu = menu
    # @comment.user_id = current_user.id
    @comment.destroy
    # redirect_to menu_path(menu)
  end


  private
  def comment_params
    params.require(:comment).permit(:comment, :menu_id)  #formにてmenu_idパラメータを送信して、コメントへmenu_idを格納するようにする必要がある。
  end
end

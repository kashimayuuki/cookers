class Admin::CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show
  end

  def destroy
    @comment = Comment.find(params[:id])
    user = User.find(params[:user_id])
    @comment.destroy
    redirect_to admin_user_path(user)
  end
end

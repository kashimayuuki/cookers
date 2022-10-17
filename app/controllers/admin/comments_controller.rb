class Admin::CommentsController < ApplicationController
  def index
  end

  def show
  end

  def destroy
    @user = User.find(params[:id])
    @comment = @user.comments
    @comment.destroy
    redirect_to admin_user_path(@user)
  end
end

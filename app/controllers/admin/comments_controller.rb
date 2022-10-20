class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  def index
  end

  def show
  end

  def destroy
    @user = User.find(params[:id])
    @comment = @user.comments.find_by(id: params[:comment_id])
    @comment.destroy
    redirect_to admin_user_path(@user)
  end
end

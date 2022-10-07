class Public::UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])

  end

  def edit
    @user = customer_user
  end

  def update
    @user = customer_user

  end

  def unsubscribe
  end

  private

  def user_params

  end
end

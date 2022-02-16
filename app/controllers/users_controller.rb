class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
  end

  def show
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "ユーザー情報を更新しました。"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user.id)
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = 'ユーザーを削除しました。'
    redirect_to :root #削除に成功すればrootページに戻る
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :image, :favorite, :encrypted_password)
  end
end

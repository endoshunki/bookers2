class UsersController < ApplicationController
  protect_from_forgery
  
  before_action :authenticate_user!

  def index
    @user = User.find(current_user.id) #今ログイン中のユーザーIDを取得（Device）
     #新規bookのデータを格納する空の容器を作成（Viewファイルに記入した）
    @users = User.all #ユーザーのテーブルにあるすべてのデータを取得
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
    else
      redirect_to user_path(current_user)
    end
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end


end

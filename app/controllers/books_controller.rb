class BooksController < ApplicationController

  before_action :authenticate_user!

  def create
    @book = Book.new(books_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
    redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = User.find(current_user.id)
      render :index
    end
  end

  def show
    @book = Book.find(params[:id]) #Bookの中の情報を取得（URLに表示、ブックごとにIDが違うから、params[:id]で取得する）
    @user = @book.user #取得したBookに紐づいたユーザーの情報を取得する
  end

  def index
    @user = User.find(current_user.id)
    @books = Book.all
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(books_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.delete
    redirect_to books_path
  end

  private

  def books_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end

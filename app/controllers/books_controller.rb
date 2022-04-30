class BooksController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @book = Book.new
  end

  def index
    @books = Book.all
    @books = Book.all.search(params[:search])
    @user = User.find(current_user.id)
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      redirect_to book_path(book.id)
    else
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.user_id != current_user.id
      redirect_to books_path
    else
      @book.destroy
      redirect_to books_path
    end
    # book = Book.find(params[:id])  # データ（レコード）を1件取得
    # book.destroy  # データ（レコード）を削除
    # redirect_to books_path  # 投稿一覧画面へリダイレクト
  end

  private

  def book_params
    params.require(:book).permit(:image, :title, :turn, :page, :genre, :read_situation, :last_day, :content)
  end

end
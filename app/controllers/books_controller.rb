class BooksController < ApplicationController
  def new
    
  end
  
  def index
    @books = Book.all
    @book = Book.new
    @user = User.find(current_user.id)
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
       redirect_to book_path(@book.id)
    else
       @user = current_user
       @books = Book.all
       render :index
    end
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.user_id != current_user.id
      redirect_to books_path
    else
      if @book.update(book_params)
        redirect_to book_path(@book.id)
      else
        render :edit
      end
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user_id != current_user.id
      redirect_to books_path
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.user_id != current_user.id
      redirect_to books_path
    else
      @book.destroy
      redirect_to books_path
    end
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
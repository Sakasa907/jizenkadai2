class BooksController < ApplicationController
    before_action :set_book, only: [:show, :edit, :update, :destroy]
  
    def index
      @books = Book.all
    end
  
    def show
    end
  
    def new
      @book = Book.new
    end
  
    def create
        @book = Book.new(book_params)
      
        if @book.save
          flash[:success] = "Book created successfully."
          redirect_to @book
        else
          flash.now[:error] = "Failed to create book."
          render 'new'
        end
      end
      
    def edit
    end
  
    def update
      if @book.update(book_params)
        flash[:success] = "Book updated successfully."
        redirect_to @book
      else
        flash.now[:error] = "Failed to update book."
        render 'edit'
      end
    end
  
    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path, flash: { success: "Book deleted successfully." }
      end    
    private
  
    def set_book
        @book = Book.find_by(id: params[:id])
        unless @book
          flash[:error] = "Book not found."
          redirect_to books_path
        end
      end
      
  
    def book_params
      params.require(:book).permit(:title, :author, :description, :body)
    end
  end
  
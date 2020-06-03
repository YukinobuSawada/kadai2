class BookersController < ApplicationController

  def index
  @book = Book.new
  @books =Book.all

end

  def show
  	@book = Book.find(params[:id])
  end

  def new

  end

  def edit
   @book = Book.find(params[:id])
  end

  def create
  	book=Book.new(book_params)
  	book.save
  	if book.save
  	redirect_to booker_path(book.id),notice:"Book was successfully created."
  end
end
def update
	book = Book.find(params[:id])
	book.update(book_params)
	if book.update(book_params)
  	redirect_to booker_path(book.id),notice:"Book was successfully updated."
end
end

def destroy
	book = Book.find(params[:id])
	book.destroy
	redirect_to bookers_path
end

  private
  def book_params
  	params.require(:book).permit(:title,:body)
  end
end

class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    # movie = Movie.find(params[:movie_id])
    @bookmark.list = @list
    # @bookmark.movie = movie
    if @bookmark.save
      redirect_to list_path(@list) # volta pra pagina da lista que vc criou o bookmark
    else
      render :new, status: :unprocessable_entity # faz isso pra dar o alerta do erro no formulario
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path
  end

  # utilizou movie_id para ter acesso a ele(chave estrangeira)
  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end

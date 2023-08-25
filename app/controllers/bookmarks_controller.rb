class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    movie = Movie.second
    @bookmark.list = @list
    @bookmark.movie = movie # tem que ter um objeto movie para poder salvar um bookmark
    if @bookmark.save
      redirect_to list_path(@list) # volta pra pagina da lista que vc criou o bookmark
    else
      render :new, status: :unprocessable_entity # faz isso pra dar o alerta do erro no formulario
    end
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end

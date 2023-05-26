class BookmarksController < ApplicationController
  before_action :set_list
  before_action :set_bookmark, only: [:destroy]

  # GET /lists/:list_id/bookmarks/new
  def new
    @bookmark = Bookmark.new
  end

  # POST /lists/:list_id/bookmarks
  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list

    if @bookmark.save
      redirect_to @list, notice: 'Bookmark was successfully created.'
    else
      render :new
    end
  end

  # DELETE /lists/:list_id/bookmarks/:id
  def destroy
    @bookmark.destroy
    redirect_to list_path(@list), notice: 'Bookmark was successfully destroyed.'
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end

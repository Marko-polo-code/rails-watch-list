class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]

  # GET /lists
  def index
    @lists = List.all
  end

  # GET /lists/:id
  def show
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks.includes(:movie)
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # POST /lists
  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to @list, notice: 'List was successfully created.'
    else
      render :new
    end
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end

class ListsController < ApplicationController
  before_action :set_find_list, only: %i[show edit update destroy]

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list.id)
    else
      render :new
    end
  end

  def destroy
    @list = List.destroy
    redirect_to lists_path
  end

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def update
    @list.update(list_params)
    redirect_to lists_path
  end

  def show
    @bookmark = Bookmark.new
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def set_find_list
    @list = List.find(params[:id])
  end
end

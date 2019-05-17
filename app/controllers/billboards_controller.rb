class BillboardsController < ApplicationController
  before_action :set_billboard, only: [ :show, :edit, :update, :destroy]

  def index
    @billboards = Billboard.all
  end

  def show
  end

  def new
    @billboard = Billboard.new
  end

  def create
    @billboard = Billboard.new(bill_params)

    if @billboard.save
      redirect_to billboards_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @billboard.update(bill_params)
      redirect_to @billboard
    else
      render :edit
    end
  end

  def destroy
    @billboard.songs.update_all(billboard_id: nil)
    @billboard.destroy
    redirect_to billboards_path
  end

  private
    def set_billboard
      @billboard = Billboard.find(params[:id])
    end

    def bill_params
      params.require(:billboard).permit(:name, :genre)
    end
end

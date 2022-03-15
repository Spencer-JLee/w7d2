class AlbumsController < ApplicationController
  before_action :require_logged_in
  def show
    @album = Album.find(params[:id])

    if @album
      render :show
    else
      redirect_to :new
    end
  end
  
  def new
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(albums_params)

    if @album.save!
      redirect_to album_url(@album)
    else
      redirect_to :new
    end
  end

  def edit
    @album = Album.find(params[:id])

    render :edit
  end

  def update
    @album = Album.find(params[:id])

    if @album.update(albums_params)
      redirect_to album_url(@album)
    else
      redirect_to :new
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to bands_url
  end

  private
  def albums_params
    params.require(:album).permit(:title, :year, :is_live, :band_id)
  end
end
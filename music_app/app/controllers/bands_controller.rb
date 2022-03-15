class BandsController < ApplicationController
  before_action :require_logged_in
  def index
    @bands = Band.all
    render :index
  end

  def show
    @band = Band.find(params[:id])

    if @band
      render :show
    else
      render :index
    end
  end

  def new
    @band = Band.new

    render :new
  end

  def create
    @band = Band.new(bands_params)

    if @band.save!
      redirect_to band_url(@band)
    else
      render :new
    end

  end

  def edit
    @band = Band.find(params[:id])

    render :edit
  end

  def update
    @band = Band.find(params[:id])

    if @band.update(bands_params)
      redirect_to band_url(@band)
    else
      redirect_to :index
    end
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    redirect_to :index
  end


  private
  def bands_params
    params.require(:band).permit(:name)
  end
end
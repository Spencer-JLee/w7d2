class TracksController < ApplicationController
  before_action :require_logged_in

  def show
    @track = Track.find(params[:id])

    if @track
      render :show
    else
      redirect_to :new
    end
  end

  def new
    @track = Track.new
    render :new
  end

  def create
    @track = Track.new(tracks_params)

    if @track.save!
      redirect_to track_url(@track)
    else
      redirect_to :new
    end
  end

  def edit
    @track = Track.find(params[:id])

    render :edit
  end

  def update
    @track = Track.find(params[:id])

    if @track.update(tracks_params)
      redirect_to track_url(@track)
    else
      redirect_to :new
    end
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy
    redirect_to bands_url
  end

  private
  def tracks_params
    params.require(:track).permit(:title, :ord, :lyrics, :is_bonus, :album_id)
  end
end
class TracksController < ApplicationController

  def new
    @all_albums = Album.all
    @all_bands = Band.all
    render :new
  end

  def create
    @track = Track.new(track_params)
    if @track.valid?
      @track.save
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  # def edit
  #   @track = Album.find(params[:id])
  #   render :edit
  # end
  #
  # def update
  #   @track = Album.find(params[:id])
  # end
  #
  # def destroy
  #
  # end

  private
  def track_params
    params.require(:track).permit(:name, :album_id)
  end

end

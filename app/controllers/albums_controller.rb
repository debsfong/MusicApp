class AlbumsController < ApplicationController

  def new
    @all_bands = Band.all
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.valid?
      @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  # def edit
  #   @album = Album.find(params[:id])
  #   render :edit
  # end
  #
  # def update
  #   @album = Album.find(params[:id])
  # end
  #
  # def destroy
  #
  # end

  private
  def album_params
    params.require(:album).permit(:name, :band_id)
  end

end

class Api::ArtistsController < ApplicationController
  def index
    @artists = Artist.all
    render json: @artists
  end

  def create
    @artist = Artist.create!(artist_params)
    redirect_to artist_path(@artist)
  end
  
  def show
    @artist = Artist.find(params[:id])
    render json: @artist
  end
  
  def update
    @artist = Artist.find(params[:id])
    @artist.update!(artist_params)
    redirect_to artist_path(@artist)
  end
  
  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    redirect_to artists_path
  end
  
  private

  def artist_params
    params.require(:artist).permit(:name, :photo_url, :nationality)
  end  
end

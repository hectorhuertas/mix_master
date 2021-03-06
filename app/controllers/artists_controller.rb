class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]

  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to @artist
    else
      render :new
    end
  end

  def show
    # @artist = Artist.find(params[:id])
    # byebug
  end

  def edit
    # byebug
    # @artist = Artist.find(params[:id])
  end

  def update
    # @artist = Artist.find(params[:id])
    if @artist.update(artist_params)
      redirect_to @artist
    else
      render :edit
    end
  end

  def destroy
    # @artist = Artist.find(params[:id])
    @artist.destroy
    redirect_to artists_path
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :image_path)
  end

  def set_artist
    @artist = Artist.find(params[:id])  
  end
end

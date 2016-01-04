class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :edit, :update]

  def index
    @playlists = Playlist.all
  end

  def new
    @playlist = Playlist.new
  end

  def create
    # byebug
    @playlist = Playlist.create(playlist_params)
    redirect_to @playlist
  end

  def show
    # @playlist = Playlist.find(params[:id])
  end

  def edit
    # @playlist = Playlist.find(params[:id])
  end

  def update
    # @playlist = Playlist.find(params[:id])
    @playlist.update(playlist_params)
    redirect_to @playlist
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name, song_ids:[])
  end

  def set_playlist
    @playlist = Playlist.find(params[:id])
  end
end

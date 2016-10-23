class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
    if !@song.artist_id  && !@song.genre_id
      @song.artist_id = 1
      @song.genre_id = 1
    end
    @artist = Artist.find(@song.artist_id)
    @genre = Genre.find(@song.genre_id)
  end

  def new 
    @song = Song.new
  end

  def create
    @song = Song.new
    @song.name = params[:song][:name]
    @song.genre_id = Genre.find(params[:song][:artist_id])
    @song.artist_id = Artist.find(params[:song][:artist_id])
    @song.save
    redirect_to song_path(@song)
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update(name: params[:song][:name])
    redirect_to song_path(@song)
  end

end

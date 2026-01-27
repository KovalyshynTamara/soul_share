class SongsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create, :edit, :update, :destroy ]

  def index
    @songs = collection
  end

  def show
    @song = resource
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    @song.added_by = current_user

    if @song.save
      redirect_to songs_path, notice: "Song created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @song = resource
  end

  def update
    @song = resource
    if @song.update(song_params)
      redirect_to song_path(@song), notice: "Song updated successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @song = resource
    @song.destroy
    redirect_to songs_path, notice: "Song deleted successfully!"
  end

  private

  def collection
    Song.all
  end

  def resource
    Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :author, :genre, :lyrics)
  end
end

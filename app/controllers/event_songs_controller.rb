class EventSongsController < ApplicationController
  before_action :authenticate_user!

  def create
    song = Song.find(params[:song_id])
    resource.songs << song unless resource.songs.include?(song)
    redirect_to resource, notice: "Song added to event."
  end

  def destroy
    song = Song.find(params[:id])
    resource.songs.delete(song)
    redirect_to resource, notice: "Song removed from event."
  end

  private

  def resource
    Event.find(params[:event_id])
  end
end

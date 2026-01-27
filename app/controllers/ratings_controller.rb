class RatingsController < ApplicationController
  before_action :authenticate_user!

  def create
    @song = Song.find(params[:song_id])
    @rating = Rating.find_or_initialize_by(user: current_user, song: @song)
    @rating.rating = params[:rating].to_i

    if @rating.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @song, notice: "Rating saved." }
      end
    else
      head :unprocessable_entity
    end
  end
end

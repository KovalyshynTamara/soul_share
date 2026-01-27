class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @event = Event.find(params[:event_id])

    @event_participant = @event.event_participants.find_or_create_by(user: current_user)

    unless @event_participant.persisted?
      redirect_to @event, alert: "Could not add comment: unable to identify event participant." and return
    end

    @comment = Comment.new(comment_params)
    @comment.event = @event
    @comment.event_participant = @event_participant

    if @comment.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @event, notice: "Comment added successfully." }
      end
    else
      render turbo_stream: turbo_stream.replace(
        "comment_form_container",
        partial: "comments/form",
        locals: { event: @event, comment: @comment }
      )
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end

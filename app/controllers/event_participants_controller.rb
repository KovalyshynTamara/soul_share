class EventParticipantsController < ApplicationController
  before_action :authenticate_user!

  def create
    @event = resource
    current_user.event_participants.create(event: @event)
    redirect_to @event, notice: "You have joined the event"
  end

  def destroy
    @event = resource
    current_user.event_participants.find_by(event: @event).destroy
    redirect_to @event, notice: "You have left the event"
  end

  def resource
    Event.find(params[:event_id])
  end
end

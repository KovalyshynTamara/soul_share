class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = collection
  end

  def show
    @event = resource
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to @event, notice: "Event was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = resource
  end

  def update
    @event = resource
    if @event.update(event_params)
      redirect_to @event, notice: "Event was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = resource
    @event.destroy
    redirect_to events_path, notice: "Event was successfully deleted."
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :location_id, :start_at, :end_at)
  end

  def collection
    Event.all
  end

  def resource
    Event.find(params[:id])
  end
end

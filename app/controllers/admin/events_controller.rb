class Admin::EventsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @events = collection
  end

  def show
    @event = resources
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to admin_events_path, notice: 'Event created successfully'
    else
      render :new
    end
  end

  def edit
    @event = resource
  end

  def update
    @event = resource
    if @event.update(event_params)
      redirect_to admin_events_path, notice: 'Event updated successfully'
    else
      render :edit
    end
  end

  def destroy
    @event = resource
    @event.destroy
    redirect_to admin_events_path, notice: 'Event deleted successfully'
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date, :location)
  end

    def collection
    Event.all
  end

  def resource
    Event.find(params[:id])
  end
end

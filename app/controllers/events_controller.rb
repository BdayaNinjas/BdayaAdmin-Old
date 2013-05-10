class EventsController < ApplicationController
  def index
    @events = Event.all
    @approved = nil
  end

  def new
    @event = Event.new
    @members = Member.all# - [current_member]
  end

  def create
    @event = Event.new params[:event]
    if @event.save
      redirect_to events_path, notice: "Event saved"
    else
      redirect_to :back, notice: "Event was not saved"
    end
  end

  def show
    @event = Event.find params[:id]
  end

  def edit
    @event = Event.find params[:id]
    @members = Member.all
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      redirect_to(@event)
    else
      render "edit"
    end
  end

  def destroy

  end

  def approve
    @event = Event.find params[:id]
    @event.update_attribute :approved, true
    redirect_to :back
  end
end
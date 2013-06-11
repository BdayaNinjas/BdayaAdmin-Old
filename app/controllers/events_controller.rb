class EventsController < ApplicationController
  
  def index
    @events = Event.all
    @approved = nil
  end

  def new
    @event = Event.new
    #3.times { @event.posters.build }
    @event.build_booth
    @event.build_logo
    @event.logo.build_image
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
    3.times { @event.posters.build }
    @event.build_booth
    @event.build_logo
    @members = Event.list_project_manager_options
  end

  respond_to :html, :json
  def update
    @event = Event.find(params[:id])
    @event.update_attributes(params[:event])
    respond_with @event
  end

  def destroy

  end

  def approve
    @event = Event.find params[:id]
    @event.update_attribute :approved, true
    redirect_to :back
  end
end
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
    @tags = Event.tags
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

  def add_tag
    @event = Event.find params[:id]
    if @event.tags_array.empty?
      @event.update_attribute :tags, params[:new_tag]
    else
      @event.update_attribute :tags, @event.tags << "," << params[:new_tag]
    end
    @event.update_attribute :tags_array, @event.tags_array << params[:new_tag]
    @event.update_attribute :materials_delivered, @event.materials_delivered << false
    redirect_to :back
  end

  def deliver_material
    @event = Event.find params[:id]
    new_delivered_array = @event.materials_delivered
    new_delivered_array[params[:tag_index].to_i] = true
    @event.update_attribute :materials_delivered, new_delivered_array
    redirect_to :back
  end
end
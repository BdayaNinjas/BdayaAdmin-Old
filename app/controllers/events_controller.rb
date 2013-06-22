class EventsController < ApplicationController
  before_filter :extract_file
  protect_from_forgery except: :rate_design

  def extract_file
   # @file = params[:event][:poster][:image].delete(:event_image) if params[:event]
  end

  def index
    @events = Event.all
    @approved = nil
  end

  def new
    @event = Event.new
    #3.times { @event.posters.build }
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
    #3.times { @event.posters.build }
    #@event.build_poster
    @items = @event.event_items
    @new_item = @event.event_items.build
    @image = @new_item.build_image
    ##@event.build_booth
    #@event.build_logo
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

  def upload_image
    @event = Event.find params[:id] 
    @image = Image.new params[:image]
    if @image.image.blank?
      redirect_to @event, alert: 'You should select an image to upload!'
      return
    end
    @image.save!
    item = @image.event_item
    item.update params[:image][:event_item]
    item.event = @event
    if item.name.blank?
      @image.destroy
      redirect_to @event, alert: 'Title can not be blank'
      return
    end
    item.save!
    #@event.update_attributes(params[:event])
    #@event.posters.first.image = @file.
    redirect_to @event, notice: 'Image uploaded successfully!'
  end

  def rate_design
    @event = Event.find params[:id]
    criterium = Criterium.find params[:criterium_id]
    rating = params[:rating].to_i
    user_id = current_member.id
    criterium.add_rating user_id, rating
    @new_rating = criterium.event_item.rating
    @user_rating = rating
    @criterium_id = criterium.id
    @item_id = criterium.event_item.id
  end
end
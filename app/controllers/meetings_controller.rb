class MeetingsController < ApplicationController
  def index
    @meetings = Meeting.all
  end

  # def show
  #   @meeting = Meeting.find(params[:id])
  # end

  # def new
  #   @meeting = Meeting.new
  # end

  # def edit
  #   @meeting = Meeting.find(params[:id])
  # end

  def create
    params[:meeting][:attendee_ids].shift
    @meeting = Meeting.new(params[:meeting])
    @meeting.creator = current_member
    @request = Request.new
    @request.session_type = 3
    @request.done = false
    @request.needers = @meeting.attendees
    @request.needers << @meeting.creator
    @request.assigned = Committee.find_by(:name => "Logistics").members.where(:role => 'Head')[0]
    @meeting.request = @request
    @request.save
    @meeting.save
    Notification.send_notification(Committee.find_by(:name => "Logistics").members.where(:role => 'Head')[0], 1, 1, "You have a new Room-Reservation request")
    redirect_to meetings_path

  end

  def update
    @meeting = Meeting.find(params[:id])
    if(params[:meeting][:attendee_ids])
      params[:meeting][:attendee_ids].shift
    end
    @meeting.update_attributes(params[:meeting])
    @meeting.attendees.each do |attender|
      param_att = "attendance_"+attender.id
      if(params[param_att])
        @meeting.attendance << [attender.id,params[param_att]]
      end
    end
    @meeting.save
    # redirect_to meetings_path
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy
    # redirect_to meetings_path
  end
end
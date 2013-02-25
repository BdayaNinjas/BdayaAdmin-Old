class MeetingsController < ApplicationController
  #Author: Hazem Tawfik
  def index
    @meetings = Meeting.all
  end

  def create
    #Solving Multi-Select issue (Sends and "" in the first index of the received array)
    # So I delete the first element in the array
    params[:meeting][:attendee_ids].shift
    @meeting = Meeting.new(params[:meeting])
    @meeting.creator = current_member
    @request = Request.new
    #Initializing the Request Send to Logistics Head to Reserve a Room for the Meeting
    @request.session_type = 3
    @request.done = false
    @request.needers = @meeting.attendees
    @request.needers << @meeting.creator
    @request.assigned = Committee.find_by(:name => "Logistics").members.where(:role => 'Head')[0]
    @meeting.request = @request
    @request.save
    @meeting.save
    #Send Notification to Logistics Head to Reserve the Room
    Notification.send_notification(Committee.find_by(:name => "Logistics").members.where(:role => 'Head')[0], 1, 1, "You have a new Room-Reservation request")
  end

  def update
    @meeting = Meeting.find(params[:id])
    #Multi-Select issue (Empty String at First)
    if(params[:meeting][:attendee_ids])
      params[:meeting][:attendee_ids].shift
    end
    #update meeting
    @meeting.update_attributes(params[:meeting])
    #update meeting attendance:
      # I loop to search in received params for attendance param with the id of the attender
      # if found, I save in the attendace of that member in the form of [attender.id,params[param_att]] in the array attendance in meeting
    @meeting.attendees.each do |attender|
      param_att = "attendance_"+attender.id
      if(params[param_att])
        @meeting.attendance << [attender.id,params[param_att]]
      end
    end
    @meeting.save
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy
  end
end
class MeetingsController < ApplicationController
  def index
    @meetings = Meeting.all
  end

  def show
    @meeting = Meeting.find(params[:id])
  end

  def new
    @meeting = Meeting.new
  end

  def edit
    @meeting = Meeting.find(params[:id])
  end

  def create
    params[:meeting][:attendee_ids].shift
    @meeting = Meeting.new(params[:meeting])
    @meeting.creator = current_member
    @meeting.save
    # redirect_to @meeting, notice: 'Meeting was successfully created.'
  end

  def update
    @meeting = Meeting.find(params[:id])
    params[:meeting][:attendee_ids].shift
    @meeting.update_attributes(params[:meeting])
    @meeting.attendees.each do |attender|
      param_att = "attendance_"+attender.id
      if(params[param_att])
        @meeting.attendance << [attender.id,params[param_att]]
      end
    end
    @meeting.save
    # redirect_to @meeting, notice: 'Meeting was successfully updated.'
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy
    # redirect_to meetings_path
  end
end
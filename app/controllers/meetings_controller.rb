class MeetingsController < ApplicationController
  # GET /meetings
  # GET /meetings.json
  def index
    @meetings = Meeting.all
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
    @meeting = Meeting.find(params[:id])
  end

  # GET /meetings/new
  # GET /meetings/new.json
  def new
    @meeting = Meeting.new
  end

  # GET /meetings/1/edit
  def edit
    @meeting = Meeting.find(params[:id])
  end

  # POST /meetings
  # POST /meetings.json
  def create
    @meeting = Meeting.new(params[:meeting])
    @meeting.save
    redirect_to @meeting, notice: 'Meeting was successfully created.'
  end

  # PUT /meetings/1
  # PUT /meetings/1.json
  def update
    @meeting = Meeting.find(params[:id])
    @meeting.update_attributes(params[:meeting])
    @meeting.attendees.each do |attender|
      param_att = "attendance_"+attender.id
      if(params[param_att])
        @meeting.attendance << [attender.id,params[param_att]]
      end
    end
    @meeting.save
    redirect_to @meeting, notice: 'Meeting was successfully updated.'
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy
    redirect_to meetings_path
  end
end
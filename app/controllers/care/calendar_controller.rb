class Care::CalendarController < Care::CareController

  before_filter :prepare_calendar

  def show
  end

  def add_event
  	@event = Event.create(params[:event])
  	@calendar.events[@event.date.day] = @event.id
  	@calendar.save
  end

private

  def prepare_calendar
    @calendar = Calendar.where(committee: "care")
  end


end

class Care::CalendarController < Care::CareController
	
  def show
    @calendar = Calendar.where(committee: "care")

  end


end

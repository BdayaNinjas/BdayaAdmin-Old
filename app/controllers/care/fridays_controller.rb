class Care::FridaysController < ApplicationController

	def show
		@friday = CareFriday.find(params[:id])
		@sessions = @friday.sessions
	end

	def index
		@fridays = CareFriday.desc(:created_at)
	end

	def edit
		@friday = CareFriday.find(params[:id])
	end


  def create
    # params[:meeting][:attendee_ids].shift
    # friday = CareFriday.find(params[:session]["friday"])
    # puts params[:session]
    # params[:session].delete("friday")
    # puts params[:session]
    session = Session.new(params[:session])
    # session.friday = friday
    if session.save
      redirect_to session.friday
    end
  end
end

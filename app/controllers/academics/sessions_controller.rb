class Academics::SessionsController < ApplicationController
	
	def new
		@session = Session.new
	end

	def create
		@teacher = Member.find(params[:teacher_id])
		@course = Course.find(params[:course_id])
		@notes = params[:notes]
		@time = params[:timing]

		Session.create_session (@course , @teacher , @time , @notes)
		redirect_to sessions_path
	end

	def update
	end

	def show
		@session = Session.find(params[:session_id])
	end

	def index
		@sessions = Session.get_sessions_date_desc
	end

	def destroy
		@session = Session.destroy(params[:session_id])
	end
end

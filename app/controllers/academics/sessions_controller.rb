class Academics::SessionsController < Academics::AcademicsController
	
	def new
		@session = Session.new
	end

	def create
		@teacher = Member.find_by(:email => params[:session][:member])
		@course = Course.find_by(:name => params[:session][:course])
		@notes = params[:session][:notes]
		@time = params[:session][:timing]

		Session.create_session(@course , @teacher , @time , @notes)
		#redirect_to academics_sessions_path
	end

	def update
		@session = Session.find(params[:id])
		@session.update_attributes(:notes => params[:session][:notes])
	end

	def show
		@session = Session.find(params[:id])
	end

	def index
		@sessions = Session.all
		# get_sessions_date_desc
	end

	def destroy
		@session = Session.find(params[:id])
		@session.request.destroy
		@session.destroy
	end
end

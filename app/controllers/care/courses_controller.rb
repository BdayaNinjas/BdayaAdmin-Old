class Care::CoursesController < Care::CareController

	def create
		course = Course.new(params[:course])
		course.type = "Care"
		course.save
		redirect_to care_courses_path
	end

	def new
	end

	def index
		@courses = Course.where(type: "Care")
	end
end

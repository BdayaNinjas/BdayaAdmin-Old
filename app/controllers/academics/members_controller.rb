class Academics::MembersController < ApplicationController
	
	def filter_semester
		@members = get_members_teach_semester(params[:sem])
	end

	def filter_course
		@course = Course.find(params[:course_id])
		@members = get_members_teach_semester(@course)
	end

	def filter_major
		@members = get_members_teach_major(params[:major])
	end

	def index
		@members = Committee.find_by(:name => "Academics").members
	end
end

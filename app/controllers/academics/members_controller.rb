class Academics::MembersController < Academics::AcademicsController
	
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
	    @head = Committee.find_by(:name => "Academics").head
	    @vices = Committee.find_by(:name => "Academics").vices
  	end
	   
	def update
	    @member = Member.find(params[:id])
	    # Update the object
	    if @member.update_attributes(params[:member])
	      # If update succeeds, redirect to the show action
	      flash[:notice] = "Member updated."
	      redirect_to(:action => 'show', :id => @member.id)
	    else
	      # If save fails, redisplay the form so user can fix problems
	      render('edit')
	    end
	end
	   
	def destroy
	    member = Member.find(params[:id])
	    member.destroy
	    flash[:notice] = "Member deleted."
	    redirect_to(:action => 'index')
	end
end

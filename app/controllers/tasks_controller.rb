class TasksController < ApplicationController
	def index
		@member = Member.find(params[:id])
		@tasks = Task.get_tasks(@member)
	end

	def Done
		@member = Member.find(params[:id])
		@tasks = Task.get_tasks(@member)
		@task = Task.find(params[:task_id])
		if (@task.assigned_to === @member)
        	@task.update_attributes(status:'Done')
			#send a not. to creator that the task is done
		end
		render ('index')
	end

	def Re_open
		@member = Member.find(params[:id])
		@tasks = Task.get_tasks(@member)
		@task = Task.find(params[:task_id])
		# if (@task.created_by === member)
		@task.update_attributes(status: 'Re_opened', comment: 'faksan')
		#send a not. to creator that the task is done
		# end
		render ('index')
	end

	def new
		@member = Member.find(params[:id])
		@task = Task.new
	end
	def approve
		@member = Member.find(params[:member_id])
		@tasks = Task.get_tasks(@member)
		@task = Task.find(params[:id])
		@task.update_attributes(:request => false)
		@task.update_attributes(:deadline => @task.requested_deadline)
		render ('index')
	end
	def disapprove
		@member = Member.find(params[:member_id])
		@tasks = Task.get_tasks(@member)
		@task = Task.find(params[:id])
		@task.update_attributes(:request => false)
		render ('index')
	end
	def create
		@member = Member.find(params[:member_id])
		@tasks = Task.get_tasks(@member)
		@task = Task.new(params[:id])
		@task.update_attributes(:assigned_to => @member, :created_by => current_member)
		@task.update_attributes(params[:task])
		render ('index')
	end

	def edit
		@member = Member.find(params[:member_id])
		@task = Task.find(params[:id])
	end

	# def update
	# 	puts "************** s#{params[:task]}"
	# 	@task = Task.find(params[:task][:id])
	# 	@member = Member.find(params[:member_id])
 #    	@task.update_attributes(params[:task])
 #    	@task.update_attributes(:request => true)
 #    	redirect_to member_tasks_path(id: params[:member_id])
 #    end

 	def destroy 
 		task = Task.find(params[:member_id])
 		task.destroy
 	end

 	def extend_deadline
		# puts "************** s#{params[:task]}"
		@task = Task.find(params[:task_id])
		@member = Member.find(params[:member_id])
    	@task.update_attributes(params[:task])
    	@task.update_attributes(:request => true)
    	redirect_to member_tasks_path(id: params[:member_id])
    end

end

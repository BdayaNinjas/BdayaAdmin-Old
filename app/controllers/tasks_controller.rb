class TasksController < ApplicationController
	def index
		@member = Member.find(params[:id])
		@tasks = Task.get_tasks(@member)
	end

	def Done
		@member = Member.find(params[:id])
		@tasks = Task.get_tasks(@member)
		@task = Task.find(params[:task_id])
		if (@task.assigned_to.id === params[:id])
        	@task.update_attributes(status:'Done')
			#send a not. to creator that the task is done
		end
		render ('index')
	end

	def Re_open
		@member = Member.find(params[:id])
		@tasks = Task.get_tasks(@member)
		@task = Task.find(params[:task_id])
		# if (@task.created_by.id === params[:id])
			@task.update_attributes(status: 'Re_opened', comment: 'faksan')
			#send a not. to creator that the task is done
		# end
		render ('index')
	end

	def new
		@member = Member.find(params[:id])
		@task = Task.new
	end

	def create
		@member = Member.find(params[:member_id])
		@tasks = Task.get_tasks(@member)
		@task = Task.new(params[:id])
		@task.assigned_to = @member
		@task.save
		render ('index')
	end

	def edit
		@member = Member.find(params[:member_id])
		@task = Task.find(params[:id])
	end

	def update
		@task = Task.find(params[:id])
		@member = Member.find(params[:member_id])
    	@task.update_attributes(params[:task])
    	redirect_to member_tasks_path(id: params[:member_id])
      	#render ('index')
    end

end

class TasksController < ApplicationController
	def index
		@member = Member.find(params[:id])
		@tasks = Task.get_tasks(@member)
	end
=begin
  This action is responsible for marking tasks as Done and the only one able to do
  this action is the member assigned to the task. Also a notification is sent to
  the creator to inform him that the task is done. All this is done in the same
  spreadsheet page.
  Author : Gasser
  Committee/Project : All
=end
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
=begin
  This action is responsible for re-opening tasks with writing a reason for this. 
  The only one able to do this action is the crator of the task. Also a notification
  is sent to the one assigned this task to inform him. All this is done in the same
  spreadsheet page.
  Author : Gasser
  Committee/Project : All
=end
	def Re_open
		@member = Member.find(params[:id])
		@tasks = Task.get_tasks(@member)
		@task = Task.find(params[:task_id])
		if (@task.created_by === member)
			@task.update_attributes(status: 'Re_opened', comment: "faksan")
		#send a not. to creator that the task is done
		end
		render ('index')
	end

	def new
		@member = Member.find(params[:id])
		@task = Task.new
	end
=begin
  This action is responsible for approving the request of deadline extension for 
  tasks and the only one able to do this action is the creator of the task. Then
  the deadline is changed to the one requested by the member and the request flag
  is set to false as the request is seen and handled.Also a notification is 
  sent to the one assigned to this task to inform him.All this is done in the same
  spreadsheet page.
  Author : Gasser
  Committee/Project : All
=end
	def approve
		@member = Member.find(params[:id])
		@tasks = Task.get_tasks(@member)
		@task = Task.find(params[:task_id])
		@task.update_attributes(:request => false)
		@task.update_attributes(:deadline => @task.requested_deadline)
		render ('index')
	end
=begin
  This action is responsible for disapproving the request of deadline extension for 
  tasks and the only one able to do this action is the creator of the task. The
  task's deadline is not changed and the request flag is set to false as the request
  is seen and handled.Also a notification is sent to the one assigned to this task to
  inform him.All this is done in the same spreadsheet page.
  Author : Gasser
  Committee/Project : All
=end
	def disapprove
		@member = Member.find(params[:id])
		@tasks = Task.get_tasks(@member)
		@task = Task.find(params[:task_id])
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

 	def destroy 
 		task = Task.find(params[:member_id])
 		task.destroy
 	end
=begin
  This action is responsible for requesting deadline extension for tasks by entering 
  the requested deadline and his excuse for this extension. The only one able to do
  this action is the one assigned for the task. The request flag is then set to true.
  Also a notification is sent to the creator of the task to approve/disapprove. All 
  this is done in the same spreadsheet page.
  Author : Gasser
  Committee/Project : All
=end
 	def extend_deadline
		@task = Task.find(params[:task_id])
		@member = Member.find(params[:id])
		@tasks = Task.get_tasks(@member)
    	@task.update_attributes(params[:task])
    	@task.update_attributes(:request => true)
    	render ('index')
    end

end

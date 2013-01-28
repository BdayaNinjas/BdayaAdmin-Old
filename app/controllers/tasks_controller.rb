class TasksController < ApplicationController
	def get_my_tasks
	   @member = Member.find(params[:id])
	   @tasks = Task.where(member: @member)
	end

end

class TasksController < ApplicationController
	def show
		@member = Member.find(params[:id])
		@tasks = Task.get_tasks(@member)
		render ('show')
	end
end

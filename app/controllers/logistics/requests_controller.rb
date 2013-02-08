class Logistics::RequestsController < ApplicationController
	

	def index
		@done = params[:done]

		@requests = current_member.get_pending_requests
		#if (@done = false)
		@done_requests = current_member.get_done_requests
		#end

	end

	def edit
		@request = Request.find(params[:id])
	end

	def update
		@request = Request.find(params[:id])
		current_member.reply_request(@request , params[:request][:room])
		redirect_to logistics_requests_path
	end

end

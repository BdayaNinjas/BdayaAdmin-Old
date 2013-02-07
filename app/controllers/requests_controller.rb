class Logistics::RequestsController < ApplicationController
	
	def index_done
		@done_requests = current_member.get_done_requests
	end

	def index_undone
		@undone_requests = current_member.get_pending_requests
	end
end

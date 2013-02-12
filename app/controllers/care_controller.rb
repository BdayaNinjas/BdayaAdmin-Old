class CareController < ApplicationController
	def index
		@members = Committee.find_by(:name => "Care").members
    	@head = Committee.find_by(:name => "Care").head
    	@vices = Committee.find_by(:name => "Care").vices
	end
end

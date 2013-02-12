class CareController < ApplicationController
	def index
		@members = Committee.find_by(:name => "Care").members.where(:role => 'Member')
    	@head = Committee.find_by(:name => "Care").members.where(:role => 'Head')[0]
    	@vices = Committee.find_by(:name => "Care").vices.where(:role => 'Vice Head')
	end
end

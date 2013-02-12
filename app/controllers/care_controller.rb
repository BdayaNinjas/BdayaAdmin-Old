class CareController < ApplicationController
	def index
		@members = Committee.find_by(:name => "Care").members.where(:role => 'Member')
    	@head = Committee.find_by(:name => "Care").members.where(:role => 'Head')[0]
    	@vices = Committee.find_by(:name => "Care").vices.where(:role => 'Vice Head')
    	@kids = Kid.all.order_by([[ :age, :asc ]])
	end

	def updateMember
        @member = Member.find(params[:id])
        # Update the object
        if @member.update_attributes(params[:member])
           flash[:notice] = "Member updated."
        end
    end
   
    def destroyMember
        member = Member.find(params[:id])
        member.destroy
        flash[:notice] = "Member deleted."
    end

end

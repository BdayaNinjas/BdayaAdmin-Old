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

    def createKid
        # Instantiate a new object using form parameters
        @kid = Kid.new(params[:kid])
        # Save the object
        if @kid.save
          # If save succeeds, redirect to the index action
          flash[:notice] = "Kid added."
        end
    end

    def updateKid
        @kid = Kid.find(params[:id])
        # Update the object
        if @kid.update_attributes(params[:kid])
          # If update succeeds, redirect to the show action
          flash[:notice] = "Kid updated."
        end
    end

    def destroyKid
        kid = Kid.find(params[:id])
        kid.destroy
        flash[:notice] = "Kid deleted."
    end

end

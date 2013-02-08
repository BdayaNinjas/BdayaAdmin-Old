class FcController < ApplicationController

	def index
		@all = Fc.all.to_a
	end

  def create
    # Instantiate a new object using form parameters
    if(current_member.committee.name == 'FC' && (current_member.role=='Head'||current_member.role=='Vice Head'))
    @record = Fc.new(params[:record])
    # Save the object
    if @record.save
      # If save succeeds, redirect to the index action
      @record.save
      flash[:notice] = "Record added."
    end
    redirect_to(:action => 'index')
  end

	def destroy
		self.delete
	end

  def update
    record = Meeting.find(params[:id])
    record.update_attributes(params[:record])
    redirect_to(:action => 'index')
    flash[:notice] = "Record updated."
  end

end



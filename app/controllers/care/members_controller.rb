class Care::MembersController < Care::CareController
	
  def index
    @members = Committee.find_by(:name => "Care").members
    @head = Committee.find_by(:name => "Care").head
    @vices = Committee.find_by(:name => "Care").vices
  end
   
  def update
    @member = Member.find(params[:id])
    # Update the object
    if @member.update_attributes(params[:member])
      # If update succeeds, redirect to the show action
      flash[:notice] = "Member updated."
      redirect_to(:action => 'show', :id => @member.id)
    else
      # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end
   
  def destroy
    member = Member.find(params[:id])
    member.destroy
    flash[:notice] = "Member deleted."
    redirect_to(:action => 'index')
  end

end

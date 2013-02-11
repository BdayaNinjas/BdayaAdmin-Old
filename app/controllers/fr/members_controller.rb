class Fr::MembersController < FR::FRController
	
  def index
    @members=Committee.find_by(name: "FR").members.where(:role => 'Member')
    @head=Committee.find_by(name: "FR").members.where(:role => 'Head')
    @vices=Committee.find_by(name: "FR").members.where(:role => 'Vice Head')
  end

  def show
    @member = Member.find(params[:id])
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

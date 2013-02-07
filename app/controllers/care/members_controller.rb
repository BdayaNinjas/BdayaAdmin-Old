class Care::MembersController < Care::CareController
	
  def index
    @members=Committee.find_by(name: "Care").members.where(:role => 'Member')
    @head=Committee.find_by(name: "Care").members.where(:role => 'Head')
    @vices=Committee.find_by(name: "Care").members.where(:role => 'Vice Head')
  end

  def show
    @member = Member.find(params[:id])
  end
   
  def edit
    @member = Member.find(params[:id])
    if(!(current_member.email==@member.email||(current_member.committee.name=='Care' && (current_member.role=='Head'||current_member.role=='Vice Head'))))
      redirect_to(:action => 'index')
    end
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
   
  def delete
    @member = Member.find(params[:id])
    if(!(current_member.email!=@member.email&&(current_member.committee.name=='Care' && (current_member.role=='Head'||current_member.role=='Vice Head'))))
      redirect_to(:action => 'index')
    end
  end
   
  def destroy
    member = Member.find(params[:id])
    member.destroy
    flash[:notice] = "Member deleted."
    redirect_to(:action => 'index')
  end

end

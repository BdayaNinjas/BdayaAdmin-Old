class Care::MembersController < Care::CareController
	
  def index
    @head = Member.where(:committee => 'Care').where(:role => 'Head')
    @vices = Member.where(:committee => 'Care').where(:role => 'Vice Head')
    @members = Member.where(:committee => 'Care').where(:role => 'Member')
  end

  def show
    @member = Member.find(params[:id])
  end
   
  def edit
    @member = Member.find(params[:id])
    if(!(current_member.email==@member.email||(current_member.committee=='Care' && (current_member.role=='Head'||current_member.role=='Vice Head'))))
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
    if(!(current_member.email!=@member.email&&(current_member.committee=='Care' && (current_member.role=='Head'||current_member.role=='Vice Head'))))
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

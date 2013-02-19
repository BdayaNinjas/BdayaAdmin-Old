class Care::MembersController < Care::CareController
	
  def index
    #get head, vices and members for Care
    @members = Committee.find_by(:name => "Care").members.where(:role => 'Member')
    @head = Committee.find_by(:name => "Care").members.where(:role => 'Head')[0]
    @vices = Committee.find_by(:name => "Care").vices.where(:role => 'Vice Head')
  end
   
  def update
    @member = Member.find(params[:id])
    # Update the object
    if @member.update_attributes(params[:member])
      flash[:notice] = "Member updated."
    end
  end
   
  def destroy
    member = Member.find(params[:id])
    # Delete the object
    member.destroy
    flash[:notice] = "Member deleted."
  end

end

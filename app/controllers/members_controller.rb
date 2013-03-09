class MembersController < ApplicationController

  def index
    # filter query
    @q=params[:q]
    # Get all members and committees in Bdaya
    @members = Member.any_of({:name => /#{@q}/}, {:email => /#{@q}/}, {:semester => /#{@q}/}, {:major => /#{@q}/}, {:role => /#{@q}/}, {:mobile => /#{@q}/}, {:tshirt => /#{@q}/})
    @committees = Committee.all
  end

  def show
    # Save the controller that the user navigated from
    @c = params[:c]
    #Get the member data to display in the profile, and his tasks
    @member = Member.find(params[:id])
    @tasks = Task.get_tasks(@member)
  end
   
  def create
    # Instantiate a new object using form parameters
    @member = Member.new(params[:member])
    @committees = Committee.all
    # Save the object
    if @member.save
      # If save succeeds, flash a message
      flash[:notice] = "Member added."
    end
  end
   
  def update
    @committees = Committee.all
    @member = Member.find(params[:id])
    # Update the object
    if @member.update_attributes(params[:member])
      # If update succeeds, flash a message
      flash[:notice] = "Member updated."
    end
  end
   
  def destroy
    member = Member.find(params[:id])
    member.destroy
    # Delete the object
    flash[:notice] = "Member deleted."
  end

  def lawlab
    redirect_to(:action => 'show', :id => current_member.id, :c => '/members')
  end

  def id
    return self.id.to_s
  end

end
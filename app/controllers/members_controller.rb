class MembersController < ApplicationController

  def index
    @members = Member.all
    @committees = Committee.all
  end

  def show
    @c = params[:c]
    @member = Member.find(params[:id])
    @tasks = Task.get_tasks(@member)
  end
   
  def create
    # Instantiate a new object using form parameters
    @member = Member.new(params[:member])
    @committees = Committee.all
    # Save the object
    if @member.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "Member added."
      redirect_to(:action => 'index')
    else
      # If save fails, redisplay the form so user can fix problems
    end
  end
   
  def update
    @committees = Committee.all
    @member = Member.find(params[:id])
    # Update the object
    if @member.update_attributes(params[:member])
      # If update succeeds, redirect to the show action
      flash[:notice] = "Member updated."
      redirect_to(:action => 'show', :id => @member.id, :c => '/members')
    else
      # If save fails, redisplay the form so user can fix problems
    end
  end
   
  def destroy
    member = Member.find(params[:id])
    member.destroy
    flash[:notice] = "Member deleted."
    redirect_to(:action => 'index')
  end

  def lawlab
    redirect_to(:action => 'show', :id => current_member.id, :c => '/members')
  end

  def id
    return self.id.to_s
  end

end
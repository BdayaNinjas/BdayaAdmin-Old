class MembersController < ApplicationController

  def index
    list
    render('list')
  end

  def list
    @members = Member.all
  end

   def show
    @member = Member.find(params[:id])
  end
   
  def new
    @member = Member.new
  end
   
  def create
    # Instantiate a new object using form parameters
    @member = Member.new(params[:member])
    # Save the object
    if @member.save
      # If save succeeds, redirect to the list action
      flash[:notice] = "Member created."
      redirect_to(:action => 'list')
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end
   
  def edit
    @member = Member.find(params[:id])
  end
   
  def update
    @member = Member.find(params[:id])
    # Update the object
    if @member.update_attributes(params[:member])
      # If update succeeds, redirect to the list action
      flash[:notice] = "Member updated."
      redirect_to(:action => 'show', :id => @member.id)
    else
      # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end
   
  def delete
    @member = Member.find(params[:id])
  end
   
  def destroy
    member = Member.find(params[:id])
    member.destroy
    flash[:notice] = "Member destroyed."
    redirect_to(:action => 'list')
  end
end

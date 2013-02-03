class MembersController < ApplicationController

  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end
   
  def new
    if(!(current_member.committee=='HR' && (current_member.role=='Head'||current_member.role=='Vice Head')))
      redirect_to(:action => 'index')
    else
      @member = Member.new
    end
  end
   
  def create
    # Instantiate a new object using form parameters
    @member = Member.new(params[:member])
    # Save the object
    if @member.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "Member added."
      redirect_to(:action => 'index')
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end
   
  def edit
    @member = Member.find(params[:id])
    if(!(current_member.email==@member.email||(current_member.committee=='HR' && (current_member.role=='Head'||current_member.role=='Vice Head'))))
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
    if(!(current_member.email!=@member.email&&(current_member.committee=='HR' && (current_member.role=='Head'||current_member.role=='Vice Head'))))
      redirect_to(:action => 'index')
    end
  end
   
  def destroy
    member = Member.find(params[:id])
    member.destroy
    flash[:notice] = "Member deleted."
    redirect_to(:action => 'index')
  end


=begin
  This Method returns all Bdaya members categorized according to committees 
  Author : Omar
=end
  def getMembersPerCommittee
    @yes = Member.getYesMembers
    @care = Member.getCareMembers
    @geneh = Member.getGenehMembers
    @academics = Member.getAcademicsMembers
    @FR = Member.getFRMembers
    @PR = Member.getPRMembers
    @HR = Member.getHRMembers
    @IT = Member.getITMembers
  end

end

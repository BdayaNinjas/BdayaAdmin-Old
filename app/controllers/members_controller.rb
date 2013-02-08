class MembersController < ApplicationController

  def index
    @members = Member.all
    @committees = Committee.all
  end

  def show
    @member = Member.find(params[:id])
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
      new
      render('new')
    end
  end
   
  def update
    @committees = Committee.all
    @member = Member.find(params[:id])
    # Update the object
    if @member.update_attributes(params[:member])
      # If update succeeds, redirect to the show action
      flash[:notice] = "Member updated."
      redirect_to(:action => 'show', :id => @member.id)
    else
      # If save fails, redisplay the form so user can fix problems
      edit
      render('edit')
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

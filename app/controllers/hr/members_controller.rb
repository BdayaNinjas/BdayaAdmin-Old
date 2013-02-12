class Hr::MembersController < ApplicationController


=begin
  This Method returns all Bdaya members categorized according to committees 
  Author : Omar
=end
  def index
    @all = Member.all
    @yes = Member.getYesMembers
    @care = Member.getCareMembers
    @geneh = Member.getGenehMembers
    @academics = Member.getAcademicsMembers
    @FR = Member.getFRMembers
    @PR = Member.getPRMembers
    @HR = Member.getHRMembers
    @IT = Member.getITMembers
    render('all')
  end

=begin
  This Action to send Reminders to Heads to evaluate their Members
  Author : Diab
=end
  def remind_heads
    Notification.remind_heads_evaluate
  end

end

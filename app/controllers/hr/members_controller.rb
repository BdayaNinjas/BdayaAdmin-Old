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

end

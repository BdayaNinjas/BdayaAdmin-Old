class Geneh::GenehCasesController < ApplicationController
  #Author: Hazem Tawfik
  def index
    @geneh_cases = GenehCase.all
    @geneh_case = GenehCase.new
  end

  def new 
    @geneh_case = GenehCase.new
    render ('_form'), :layout => false
  end

  def create
    #the multi-select sends the first item in list as empty string "", so .shift delets first
    #it's received as list of ids
    params[:geneh_case][:responsible_person_ids].shift
    @geneh_case = GenehCase.new(params[:geneh_case])
    @geneh_case.creator = current_member
    @geneh_case.save
    @geneh_cases = GenehCase.all
    render ('index')
  end

  def edit
    @geneh_case = GenehCase.find(params[:id])
    render ('_form'), :layout => false
  end

  def update
    @geneh_case = GenehCase.find(params[:id])
    #if there are responsible_person_ids send remove the first item because of the multi-select issue to make the list ready
    if(params[:geneh_case][:responsible_person_ids])
      params[:geneh_case][:responsible_person_ids].shift
    end
    @geneh_case.update_attributes(params[:geneh_case])
    @geneh_case.save

    # FIX THIS ***********************************************************************
    @geneh_cases = GenehCase.all
    render ('index')
  end

  def destroy
    @geneh_case = GenehCase.find(params[:id])
    @geneh_case.destroy
  end
end
class Geneh::GenehController < ApplicationController
  def index
    @geneh_cases = GenehCase.all
  end

  def create
    params[:geneh_case][:responsible_person_ids].shift
    @geneh_case = GenehCase.new(params[:geneh_case])
    @geneh_case.creator = current_member
    @geneh_case.save
  end

  def update
    @geneh_case = GenehCase.find(params[:id])
    if(params[:geneh_case][:responsible_person_ids])
      params[:geneh_case][:responsible_person_ids].shift
    end
    @geneh_case.update_attributes(params[:geneh_case])
    @geneh_case.save
  end

  def destroy
    @geneh_case = GenehCase.find(params[:id])
    @geneh_case.destroy
  end
end
class Logistics::MaterialsController < ApplicationController
  def index
    @materials = Materials.all
  end

  def create
    @material = Materials.new(params[:materials])
    @material.save
  end

  def update
    @material = Materials.find(params[:id])
    @material.update_attributes(params[:materials])
  end

  def destroy
    @material = Materials.find(params[:id])
    @material.destroy
  end

end

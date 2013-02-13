class Logistics::ResourcesController < ApplicationController
	def index
    @resources = Resources.all
  end

  def create
    @resource = Resources.new(params[:resources])
    @resource.save
  end

  def update
    @resource = Resources.find(params[:id])
    @resource.update_attributes(params[:resources])
  end

  def destroy
    @resource = Resources.find(params[:id])
    @resource.destroy
  end

end

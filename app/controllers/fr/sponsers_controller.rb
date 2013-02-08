class Fr::SponsersController < ApplicationController

	def index
		@sponsers = Sponser.all	
	end

	def new
		@sponser = Sponser.new
	end

	def show 
	end

	def create
		@sponser = Sponser.create!(params[:sponser])
		#redirect_to fr_sponsers_path
	end

	def edit
		@sponser = Sponser.find(params[:id])
	end

	def update
		@sponser = Sponser.find(params[:id])
		@sponser.update_attributes(params[:sponser])
		#redirect_to fr_sponsers_path
	end

	def destroy
		Sponser.find(params[:id]).destroy
		#redirect_to fr_sponsers_path
	end
end

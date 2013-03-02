class HegzasController < ApplicationController
	def index
		@hegza = Hegza.new
		@hegzas = Hegza.all
	end 
	def new 
		@hegza = Hegza.new
	end 

	def create 
		@hegza = Hegza.new (params[:hegza])
		@hegza.save
		index
		render ('index')
	end 
	def update 
		@hegza = Hegza.find(params[:id])
		@@hegza.update_attributes(params [:hegza])
		@hegza.save
	end 
	def edit 
		@hegza = Hegza.find(params[:id])
	end
	def destroy
		@hegza = Hegza.find(params[:id])
		@hegza.destroy
	end 

end

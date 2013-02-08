class Care::FridaysController < ApplicationController

	def show
		@friday = CareFriday.find(params[:id])
		@sessions = @friday.sessions
		@materials = @friday.materials

	end

	def index
		@fridays = CareFriday.desc(:created_at)
	end

	def edit
		@friday = CareFriday.find(params[:id])
	end

	def update
	end

	def new
	end

	def create

	end
end

class Care::KidsController < Care::CareController

	def show
		@kid = Kid.find(params[:id])
	end

	def index
		@kids = Kid.all
	end

	def new
		@kid = Kid.new
	end

	def create
		@kid = Kid.create(params[:kid])
	end

	def edit
		@kid = Kid.find(params[:id])
	end
end

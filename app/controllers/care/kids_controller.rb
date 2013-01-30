class Care::KidsController < Care::CareController

<<<<<<< HEAD
  def show
    @kid = Kid.find(params[:id])
  end

=======
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
>>>>>>> 37271ea95224949f07cbdc1fcf954cf9bfe83616
end

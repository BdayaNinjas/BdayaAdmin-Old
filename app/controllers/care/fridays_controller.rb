class Care::FridaysController < Care::CareController

	def show
		@friday = CareFriday.find(params[:id])
		@sessions = @friday.sessions
	end

	def index
		@fridays = CareFriday.desc(:created_at)
	end

	def edit
		@friday = CareFriday.find(params[:id])
	end

  def new
    @friday = CareFriday.new()
  end

  def create
    friday = CareFriday.create(params[:friday])
    Kid.all.each do |kid|
      kid.performance.merge!(friday.date.to_s => {})
      kid.save
    end
    redirect_to care_fridays_path
  end

  def create_session
    session = Session.new(params[:session])
    if session.save
      Kid.all.each do |kid|
        puts session.friday.date.to_s
        kid.performance[session.friday.date.to_s].merge!(session.course.name => {})
        kid.save        
      end
      redirect_to session.friday
    end
  end
end

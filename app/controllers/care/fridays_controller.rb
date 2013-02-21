class Care::FridaysController < Care::CareController

  #show friday + its sessions
	def show
		@friday = CareFriday.find(params[:id])
		@sessions = @friday.sessions
	end

  #all fridays sorted desc according to their dates
	def index
		@fridays = CareFriday.desc(:created_at)
	end

  # edit friday
	def edit
		@friday = CareFriday.find(params[:id])
	end

  def new
    @friday = CareFriday.new()
  end

  #create a new friday , add it to the performance hash an entry for this friday
  def create
    friday = CareFriday.create(params[:friday])
    Kid.all.each do |kid|
      kid.performance.merge!(friday.date.to_s => {})
      kid.save
    end
    redirect_to care_fridays_path
  end


  #creates a new session , adds to the performance hash an entry for this session
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

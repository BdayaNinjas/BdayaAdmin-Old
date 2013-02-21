class Care::KidsController < Care::CareController

  def index
    #get all kids sorted by age
    @kids = Kid.all.order_by([[ :age, :asc ]])
  end

  def show
    @kid = Kid.find(params[:id])
    @fridays = CareFriday.all
  end
   
  def create
    # Instantiate a new object using form parameters
    @kid = Kid.new(params[:kid])
    # Save the object
    if @kid.save
      # If save succeeds, flash a message
      flash[:notice] = "Kid added."
    end
  end
  
  def update
    @kid = Kid.find(params[:id])
    # Update the object
    if @kid.update_attributes(params[:kid])
      # If update succeeds, flash a message
      flash[:notice] = "Kid updated."
    end
  end

  # add kid's performance , by accessing the hash with the friday and the session
  def add_performance
    kid = Kid.find(params[:kid])
    
    params[:performance].keys.each do |session_name|
      kid.performance[params[:friday]][session_name] = params[:performance][session_name]
      kid.save
    end
    redirect_to care_kid_path(params[:kid])
  end

   
  def destroy
    kid = Kid.find(params[:id])
    kid.destroy
    flash[:notice] = "Kid deleted."
  end

end
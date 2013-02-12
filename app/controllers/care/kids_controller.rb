class Care::KidsController < Care::CareController

  def index
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
      # If save succeeds, redirect to the index action
      flash[:notice] = "Kid added."
    end
  end
  
  def update
    @kid = Kid.find(params[:id])
    # Update the object
    if @kid.update_attributes(params[:kid])
      # If update succeeds, redirect to the show action
      flash[:notice] = "Kid updated."
    end
  end

  def add_performance
    puts 'walaaaa'
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
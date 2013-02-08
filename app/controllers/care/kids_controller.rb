class Care::KidsController < Care::CareController

  def index
    @kids = Kid.all.order_by([[ :age, :asc ]])
  end

  def show
    @kid = Kid.find(params[:id])
  end
   
  def create
    # Instantiate a new object using form parameters
    @kid = Kid.new(params[:kid])
    # Save the object
    if @kid.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "Kid added."
      redirect_to(:action => 'index')
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end
   
  def update
    @kid = Kid.find(params[:id])
    # Update the object
    if @kid.update_attributes(params[:kid])
      # If update succeeds, redirect to the show action
      flash[:notice] = "Kid updated."
      redirect_to(:action => 'show', :id => @kid.id)
    else
      # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end
   
  def destroy
    kid = Kid.find(params[:id])
    kid.destroy
    flash[:notice] = "Kid deleted."
    redirect_to(:action => 'index')
  end

  def performance
    @kid = Kid.find(params[:kid])
    @fridays = @kid.fridays
  end
end
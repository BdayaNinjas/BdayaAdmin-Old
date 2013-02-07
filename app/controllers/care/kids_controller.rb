class Care::KidsController < Care::CareController

  def index
    @kids = Kid.all.order_by([[ :age, :asc ]])
  end

  def show
    @kid = Kid.find(params[:id])
  end
   
  def new
    if(!(current_member.committee.name=='Care' && (current_member.role=='Head'||current_member.role=='Vice Head')))
      redirect_to(:action => 'index')
    else
      @kid = Kid.new
    end
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
   
  def edit
    if(!(current_member.committee.name=='Care' && (current_member.role=='Head'||current_member.role=='Vice Head')))
      redirect_to(:action => 'index')
    else
      @kid = Kid.find(params[:id])
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
   
  def delete
    if(!(current_member.committee.name=='Care' && (current_member.role=='Head'||current_member.role=='Vice Head')))
      redirect_to(:action => 'index')
    else
      @kid = Kid.find(params[:id])
    end
  end
   
  def destroy
    kid = Kid.find(params[:id])
    kid.destroy
    flash[:notice] = "Kid deleted."
    redirect_to(:action => 'index')
  end
end
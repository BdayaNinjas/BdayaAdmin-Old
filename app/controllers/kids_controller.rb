class KidsController < ApplicationController

  def index
    list
    render('list')
  end

  def list
    @kids = Kid.all.order_by([[ :age, :asc ]])
  end

   def show
    @kid = Kid.find(params[:id])
  end
   
  def new
    @kid = Kid.new
  end
   
  def create
    # Instantiate a new object using form parameters
    @kid = Kid.new(params[:kid])
    # Save the object
    if @kid.save
      # If save succeeds, redirect to the list action
      flash[:notice] = "Kid created."
      redirect_to(:action => 'list')
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end
   
  def edit
    @kid = Kid.find(params[:id])
  end
   
  def update
    @kid = Kid.find(params[:id])
    # Update the object
    if @kid.update_attributes(params[:kid])
      # If update succeeds, redirect to the list action
      flash[:notice] = "Kid updated."
      redirect_to(:action => 'show', :id => @kid.id)
    else
      # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end
   
  def delete
    @kid = Kid.find(params[:id])
  end
   
  def destroy
    kid = Kid.find(params[:id])
    kid.destroy
    flash[:notice] = "Kid destroyed."
    redirect_to(:action => 'list')
  end
end

class Yes::TrainersController < ApplicationController

  def index
    @trainers = Trainer.all
  end

  # def show
  #   @trainer = Trainer.find(params[:id])
  # end

  # def new
  #   @trainer = Trainer.new
  # end

  # def edit
  #   @trainer = Trainer.find(params[:id])
  # end

  def create
    @trainer = Trainer.new(params[:trainer])
    redirect_to @trainer, notice: 'Trainer was successfully created.'
  end

  def update
    @trainer = Trainer.find(params[:id])
    redirect_to @trainer, notice: 'Trainer was successfully updated.'
  end

  def destroy
    @trainer = Trainer.find(params[:id])
    @trainer.destroy
    # redirect_to yes_trainers_url 
  end
end

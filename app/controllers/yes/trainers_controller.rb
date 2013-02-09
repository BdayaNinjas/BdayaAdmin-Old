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
    params[:trainer][:topics] = params[:trainer][:topics].split(',')
    @trainer = Trainer.new(params[:trainer])
    @trainer.save
    redirect_to yes_trainers_path 
  end

  def update
    params[:trainer][:topics] = params[:trainer][:topics].split(',')
    @trainer = Trainer.find(params[:id])
    @trainer.update_attributes(params[:trainer])
    redirect_to yes_trainers_path 
  end

  def destroy
    @trainer = Trainer.find(params[:id])
    @trainer.destroy
    redirect_to yes_trainers_path 
  end
end

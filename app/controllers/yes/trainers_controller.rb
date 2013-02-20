class Yes::TrainersController < Yes::YesController
  #Author: Hazem Tawfik
  def index
    @trainers = Trainer.all
  end

  def create
    #the trainer topics are entered as topics (String) splitted by commas, So I parce and save save them in array in case of filtering in the future it would be much easier
    params[:trainer][:topics] = params[:trainer][:topics].split(',')
    @trainer = Trainer.new(params[:trainer])
    @trainer.save
  end

  def update
    params[:trainer][:topics] = params[:trainer][:topics].split(',')
    @trainer = Trainer.find(params[:id])
    @trainer.update_attributes(params[:trainer])
  end

  def destroy
    @trainer = Trainer.find(params[:id])
    @trainer.destroy
  end
end

class Yes::TrainingCompaniesController < Yes::YesController
  #Author: Hazem Tawfik
  def index
    @training_companies = TrainingCompany.all
  end

  def create
    #the training fields are entered as fields (String) splitted by commas, So I parse and save them in array in case of filtering in the future it would be much easier
    params[:training_company][:training_fields] = params[:training_company][:training_fields].split(',')
    @training_company = TrainingCompany.new(params[:training_company])
    @training_company.save
  end

  def update
    params[:training_company][:training_fields] = params[:training_company][:training_fields].split(',')
    @training_company = TrainingCompany.find(params[:id])
    @training_company.update_attributes(params[:training_company])
  end

  def destroy
    @training_company = TrainingCompany.find(params[:id])
    @training_company.destroy
  end
end

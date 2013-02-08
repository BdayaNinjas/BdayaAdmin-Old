class Yes::TrainingCompaniesController < ApplicationController

  def index
    @training_companies = TrainingCompany.all
  end

  # def show
  #   @training_company = TrainingCompany.find(params[:id])
  # end

  # def new
  #   @training_company = TrainingCompany.new
  # end

  # def edit
  #   @training_company = TrainingCompany.find(params[:id])
  # end

  def create
    @training_company = TrainingCompany.new(params[:training_company])
    @training_company.save
    # redirect_to @training_company, notice: 'Training company was successfully created.'
  end

  def update
    @training_company = TrainingCompany.find(params[:id])
    @training_company.update_attributes(params[:training_company])
    # redirect_to @training_company, notice: 'Training company was successfully updated.'
  end

  def destroy
    @training_company = TrainingCompany.find(params[:id])
    @training_company.destroy
    # redirect_to yes_training_companies_url
  end
end

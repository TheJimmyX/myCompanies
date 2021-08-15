class Api::CompaniesController < ApplicationController
  before_action       :get_company, only: [:show, :update]
  skip_before_action  :verify_authenticity_token, only: [:create]

  def index
    companies = Company.all
    render json: companies.as_json(only: company_attributes)
  end

  def show
    render json: @company.as_json(only: company_attributes)
  end

  def create
    company = Company.new(company_params)
    if company.save
      render json: company.as_json(only: company_attributes)
    else
      render json: {"message": "error"}
    end
  end

  private

  def company_attributes
    [:id, :name, :address, :nit, :phone_number]
  end

  def company_params
    params.require(:company).permit(:name, :nit, :address, :phone_number)
  end

  def get_company
    @company = Company.find(params[:id])
  end
  
end

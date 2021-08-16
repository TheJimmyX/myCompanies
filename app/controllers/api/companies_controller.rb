class Api::CompaniesController < Api::BaseController
  before_action :get_company, only: [:show, :update, :destroy, :employes]

  def index
    companies = Company.all
    render json: companies.as_json(only: company_attributes)
  end

  def show
      render json: @company.as_json(only: company_attributes)
  end

  def create
    company = Company.new(company_params)
   
    render json: company.as_json(only: company_attributes)  if company.save!
  end

  def update
    render json: @company.as_json(only: company_attributes) if @company.update!(company_params)
  end

  def destroy
    render json: @company.as_json(only: company_attributes) if @company.destroy!
  end
  

  def employes
    render json: @company.as_json(only: [:name], include: { employes: { only: [:first_name, :last_name, :id_type, :id_number, :phone_number, :email]} })
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

class Api::CompaniesController < Api::BaseController
  before_action :get_company, only: [:show, :update, :destroy, :employes]

  def index
    @pagy, companies = pagy(
      !params[:search] || params[:search].empty? || params[:search] == "null" ? 
        Company.all :         
        Company.where("name LIKE ? OR nit LIKE ? OR address LIKE ? OR phone_number LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")        
    )

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
    @pagy, employes = pagy(@company.employes)
    render json: employes.as_json(only: employe_attributes, include: { company: { only: :name}})
  end

  private

  def company_attributes
    [:id, :name, :address, :nit, :phone_number]
  end

  def employe_attributes
    [:first_name, :last_name, :id_type, :id_number, :phone_number, :email]
  end

  def company_params
    params.require(:company).permit(:name, :nit, :address, :phone_number)
  end

  def get_company
    @company = Company.find(params[:id])    
  end
  
end

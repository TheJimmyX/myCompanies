class Api::EmployesController < Api::BaseController
  before_action :get_employe, only: [:show, :update, :destroy]   

  def index
    @pagy, employes = pagy(Employe.all)

    render json: employes.as_json(only: employes_attributes, include: :company)
  end

  def show
    render json: @employe.as_json(only: employes_attributes, include: :company)
  end

  def create
    employe = Employe.new(employe_params)

    render json: employe.as_json(only: employes_attributes, include: :company) if employe.save!
  end

  def update
    render json: @employe.as_json(only: employes_attributes, include: :company) if @employe.update!(employe_params)
  end

  def destroy
    render json: @employe.as_json(only: employes_attributes) if @employe.destroy!
  end

  private

  def employe_params
    params.require(:employe).permit(:first_name, :last_name, :id_type, :id_number, :phone_number, :email, :company_id)
  end

  def employes_attributes
    [:id, :first_name, :last_name, :id_type, :id_number, :phone_number, :email]
  end

  def get_employe
    @employe = Employe.find(params[:id])
  end
end

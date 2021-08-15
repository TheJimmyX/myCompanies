class Api::EmployesController < Api::BaseController
  before_action :get_employe, only: [:show, :update, :destroy] 

  def index
    employes = Employe.all

    render json: employes.as_json(only: employes_attributes, include: :company)
  end

  def show
    render json: @employe.as_json(only: employes_attributes, include: :company)
  end

  private

  def employes_attributes
    [:id, :first_name, :last_name, :id_type, :id_number, :phone_number, :email]
  end

  def get_employe
    @employe = Employe.find(params[:id])
  end
end

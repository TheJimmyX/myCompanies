class Api::BaseController < ActionController::Base
  include Pagy::Backend  

  after_action { pagy_headers_merge(@pagy) if @pagy }
  
  skip_before_action  :verify_authenticity_token, only: [:create, :update, :destroy]
    
  rescue_from ActiveRecord::RecordNotFound, with: :handle_error
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
  rescue_from ActionController::ParameterMissing, with: :parameter_missing

  private

  def handle_error(e)
    render json: { error: e.to_s }, status: :bad_request
  end

  def record_invalid(e)
      render json: { error: e.to_s }, status: :unprocessable_entity
  end

  def parameter_missing(e)
    render json: { error: e.to_s }, status: :unprocessable_entity
  end
end

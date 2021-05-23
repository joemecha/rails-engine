class ApplicationController < ActionController::API
  # include ActionController::Helpers
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :record_bad_request


  private 

  def record_not_found
    render plain: "404 Not Found", status: 404
  end

  def record_bad_request
    render json: { error: '400 Bad Request' }, status: :bad_request
  end
end

module JsonResponse
  def json_error_response(error_message, status_code)
    redirect_to categories_path, alert: error_message
  end

  def json_response(message, status_code)
    render json: { data: message }, status: status_code
  end
end
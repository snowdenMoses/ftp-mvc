module JsonResponse

  def json_error_response(error_message, status_code)
    redirect_back fallback_location: :home_root, alert: error_message
  end

end
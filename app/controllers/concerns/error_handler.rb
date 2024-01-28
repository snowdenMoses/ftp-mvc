module ErrorHandler
  include JsonResponse

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  def user_not_authorized
    json_error_response('insufficient privileges', 403)
  end
end
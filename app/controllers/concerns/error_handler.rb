module ErrorHandler
  extend ActiveSupport::Concern
  include JsonResponse

  included do
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    rescue_from Record::NotFound, with: :no_record
  end

  def user_not_authorized
    json_error_response('insufficient privileges', 403)
  end

  def no_record(message)
    json_error_response(message, 404)
  end
end
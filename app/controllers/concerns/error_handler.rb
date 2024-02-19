module ErrorHandler
  extend ActiveSupport::Concern
  include JsonResponse

  included do
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    rescue_from ActiveRecord::RecordNotFound, with: :no_record
    rescue_from ErrorDefinations::DuplicateRecord, with: :record_not_unique
  end

  def user_not_authorized
    json_error_response('insufficient privileges', 403)
  end

  def no_record(message)
    json_error_response(message, 404)
  end

  def record_not_unique(message )
    json_error_response(message, 400 )
  end
end
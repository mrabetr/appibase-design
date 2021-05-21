class ApplicationController < ActionController::API
  # All actions explicitly respond to JSON format only
  # https://github.com/heartcombo/devise/issues/4997
  # include ActionController::MimeResponds
  # respond_to :json

  # # Prevent CSRF attacks by raising an exception. Use :exception.
  # # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :null_session

  # # Raised by exceptions other than the below
  # rescue_from ActiveRecord::StandardError, with: :standard_error
  # # Raised by save! and create! when the record is invalid
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
  # # Raised when a record cannot be inserted because it would violate a uniqueness constraint
  # rescue_from ActiveRecord::RecordNotUnique, with: :record_not_unique
  # # Raised when Active Record cannot find record by given id or set of ids
  # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  # # Raised by ActiveRecord::Base.destroy!
  # rescue_from ActiveRecord::RecordNotDestroyed, with: :record_not_destroyed

  private

  # def standard_error(exception)
  #   render json: { errors: exception.message }, status: 500
  # end

  def record_invalid(exception)
    render json: { errors: exception.record.errors }, status: :unprocessable_entity
  end

  # def record_not_unique(exception)
  #   render json: { errors: exception.record.errors }, status: :unprocessable_entity
  # end

  # def record_not_found(exception)
  #   render json: { errors: exception.message }, status: :not_found
  # end

  # def record_not_destroyed(exception)
  #   render json: { errors: exception.record.errors }, status: :unprocessable_entity
  # end
end

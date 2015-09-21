class ApplicationController < ActionController::Base
  # rescue_from ActiveRecord::RecordNotFound, with: :not_found
  # rescue_from ActionController::UnknownFormat, with: :unknown_format

  def index
    render text: '', layout: 'application'
  end
end

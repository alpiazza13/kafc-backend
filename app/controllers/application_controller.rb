class ApplicationController < ActionController::API
  include ActionController::ImplicitRender

  before_action :authenticate_request
  respond_to :json

  def authenticate_request
    true
  end
end

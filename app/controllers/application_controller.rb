class ApplicationController < ActionController::API
  include ActionController::ImplicitRender

  before_action :authenticate_request

  def authenticate_request
    true
  end
end

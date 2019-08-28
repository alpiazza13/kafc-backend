class ApplicationController < ActionController::API
  include ActionController::ImplicitRender

  before_action :authenticate_request

  def authenticate_request
    return true if Rails.env.test?
    
    user = warden.authenticate(scope: :user)
    render status: 401, json: { message: 'unauthorized' } unless user.present?
  end
end

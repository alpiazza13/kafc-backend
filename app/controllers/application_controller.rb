class ApplicationController < ActionController::API
  include ActionController::ImplicitRender

  before_action :authenticate_user!

end

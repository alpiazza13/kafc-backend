class UnlocksController < Devise::UnlocksController
  protected

  def after_unlock_path_for(resource)
    '/login/unlocked'
  end
end

class Api::V1::SessionsController < Devise::SessionsController
  def create
    user = warden.authenticate!(scope: resource_name, recall: "#{controller_path}#failure")
    return_logged_in_user(user)
  end

  def destroy
    if current_user
      warden.authenticate!(scope: resource_name, recall: "#{controller_path}#failure")
      sign_out

      render json: { status: 200 }
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def return_logged_in_user(user)
    render status: 200,
           json: {
             success: true,
             info: 'Logged In',
             user: { id: user.id, name: user.full_name }
           }
  end
end

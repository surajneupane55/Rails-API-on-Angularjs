class Api::SessionController < Devise::SessionController
  before_action  :warden_authenticate

  def create
    sign_in(resource_name, resource)
    resource.reset_auth_token
    render json: {auth_token: resource.auth_token}
  end

  def destroy
    sign_out(resource_name)
    resource.clear_authentication_token!
    render json: {message: 'go f.... urself'}
    end
  private
  def warden_authenticate
    self.resource= warden.authenticate!(auth_options)
  end

end

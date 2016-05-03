class Api::SessionsController < Devise::SessionsController
  skip_before_action :verify_signed_out_user, only: :destroy
  before_action :warden_authenticate, only: :create

  def create
    sign_in(resource_name, resource)
    resource.create_authentication_token!
    render json: {authenticate_token: resource.authenticate_token}
  end

  def destroy
    if resource = User.find_by_authenticate_token(params[:authenticate_token])
      sign_out(resource_name)
      resource.destroy_authentication_token!
      render json: 'successfully sign_out'
    else
      render json: {}, status: 401
    end
  end

  private

  def warden_authenticate
    self.resource = warden.authenticate!(auth_options)
  end
end



=begin
  skip_before_action :verify_authenticity_token
  skip_before_action :verify_signed_out_user, only: :destroy


  def create
    authenticate_or_request_with_http_basic do |username, password|
      resource = User.find_by_email(username)
      if resource.valid_password?(password)
       resource.create_authentication_token!
        render json: {authenticate_token: resource.authenticate_token}
      else
        render json: {}, status: 401
      end
    end
  end



  def destroy
    resource = User.find_by_authenticate_token(params[:authenticate_token])
    resource.destroy_authentication_token!
    render nothing: true
  end
=end



class Api::BaseController < ApplicationController
  before_action :authenticate

  private

  def authenticate
    authenticate_token = request.headers['X-Authenticate-Token']
    @user = User.where(authenticate_token: authenticate_token).first if authenticate_token
    @current_user = @user

    unless @user
      head status: :unauthorized
    end
  end


  def permission_denied
    render json: {error: 'unauthorized'}, status: :unauthorized
  end
end
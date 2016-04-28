class Api::BaseController < ApplicationController
  before_action :authenticate_user!
 def current_user
   @current_user = @user
 end
  private

  def authenticate
    authenticate_token = request.headers['X-Authenticate-Token']
    @user = User.where(authenticate_token: authenticate_token).first if authenticate_token
  end
  unless @user
    permission_denied
  end

  def permission_denied
    render json: {error: 'unauthorized'}, status: :unauthorized
  end
end
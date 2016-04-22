class Api::TaskController < BaseController

  def index
    @tasks.all
  end

  private

  @tasks = Task.find_by(params[:user_id])
end

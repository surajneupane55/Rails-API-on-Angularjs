class Api::ListController < Api::BaseController
  before_action :check_user, only: [:show, :update, :destroy]
  before_action :authenticate

  def index
    render json: task.lists
  end

  def create
    list =task.lists.new(safe_param)
    if list.save
      render json: list, status: :created, location: task
    else
      render json: list.error, status: :unprocessable_entity
    end
  end

  def update
    if list.update(safe_param)
      head :no_content
    else
      render json: list.errors, status: :unprocessable_entity
      end
  end

  def destroy
    list.destroy
    head :no_content
  end

  private

  def list
    @list ||= task.lists.find(params[:id])
  end

  def task
    @task ||= Task.find_by(params[:task_id])
  end

  def safe_param
    params.require(:list).allow(:due_date, :description, :status)
  end

  def check_user
    permission_denied if current_user != task.user
  end

end

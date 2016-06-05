class Api::ListsController < Api::BaseController

  before_action :check_user, only: [:show, :update, :destroy]

  def index
    render json: task.lists

  end

  def create
    list =task.lists.new(safe_param)
    if list.save
      render json: list, status: :created
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
    if list.destroy
      render json: "kai kai kai"
    end
  end

  private

  def list
    @list ||= task.lists.find(params[:id])
  end

  def task
    @task ||= Task.find(params[:task_id])
  end


  def safe_param
    params.require(:list).permit(:description, :status, :due_date)
  end

  def check_user
    permission_denied if current_user != task.user
  end
end

class Api::TasksController < Api::BaseController

  before_action :check_user, only: [:show, :update, :destroy]
  before_action :task, only: [:show, :update, :destroy]

  def index
    render json: @current_user.tasks
  end

  def create
    task = @current_user.tasks.new(safe_params)

    if task.save
      render json: task, status: :created
    else
      render json: task.errors, status: :unprocessable_entity
    end
  end

  def update
    if task.update(safe_params)
      head :no_content
    else
      render json: task.error, status: :unprocessable_entity
    end
  end

  def show
    render json: @task
  end

  def destroy
    task.destroy
    head :no_content
  end

  private
  def check_user
    permission_denied if @current_user != set_task.user
  end

  def safe_params
    params.require(:task).permit(:name)
  end

  def task
    @task ||= Task.find(params[:id])
  end

  def set_task
    @task ||= Task.find(params[:id])
  end
end

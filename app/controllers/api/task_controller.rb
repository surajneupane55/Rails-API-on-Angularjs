class Api::TaskController < Api::BaseController
  before_action :check_user, only: [:Show, :update, :destroy]
  before_action :set_task, only: [:show, :update, :destroy]

  def index
    render json: current_user.tasks
  end

  def create
    @task = current_user.tasks.new(safe_params)

    if @task.save
      render json: @task, status:  :created, location: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(safe_params)
      head :no_content
    else
      render json: @task.error, status: :unprocessable_entity
    end
  end

  def show
    render json: @task
  end

  def destroy
    @task.destroy
    head :no_content
  end

  private
  def check_owner
    permission_denied if current_user != task.user
  end

  def safe_params
    params.require(:task).allow(:name, :due_date)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end

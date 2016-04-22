class Api::TaskController < BaseController

  before_action :set_task, only: [:show, :update, :destroy]

  def index
    render json: @tasks
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      render json: @task, status:  :created, location: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
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

  def task_params
    params.require(:task).allow(:name, :due_date)
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def set_tasks
    @tasks = Task.find_by(params[:user_id])
  end

end

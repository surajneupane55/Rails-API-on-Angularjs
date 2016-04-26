class Api::ListController < Api::BaseController
  before_action :check_user, only: [:show, :update, :destroy]

  def index
    render json: @lists.all
  end

  def create
    @list =task.list.new(safe_param)
    if @list.save
      render json: @list, status: :created, location: @task
    else
      render json: @list.error, status: :unprocessable_entity
    end
  end

  def update
    if @list.update(safe_param)
      head :no_content
    else
      render json: @list.errors, status: :unprocessable_entity
      end
  end

  def destroy
    @list.destroy
    head :no_content
  end

  private
  def set_list
    @list ||= task.List.find(params[:id])
  end

  def set_lists
    @lists ||= task.List.find(params[:task_id])
  end

  def set_task
    @task ||= Task.find(params[:task_id])
  end

  def safe_param
    params.require(:list).allow(:due_date, :description, :status)
  end

  def check_owner
    permission_denied if current_user != task.owner
  end

end

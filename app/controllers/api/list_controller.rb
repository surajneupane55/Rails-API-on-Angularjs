class Api::ListController < BaseController
  before_action :set_list, only:[:show, :update, :destroy ]

  def index
    render json: @lists
  end

  def create
    @list = List.new(list_param)
    if @list.save
      render json: @list, status: :created, location: @task
    else
      render json: @list.error, status: :unprocessable_entity
    end
  end

  def show
    render json: @list
  end

  def update
    if @list.update(list_param)
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
    @list = List.find(params[:id])
  end

  def set_lists
    @lists=List.find(params[:task_id])
  end

  def list_param
    params.require(:list).allow(:due_date, :description, :status)
  end

end

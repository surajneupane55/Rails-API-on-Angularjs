class Api::ListController < BaseController
  def index

  end

  def new
  end

  def create

  end

  def show
    @list=List.find(:id)
  end

  def update

  end

  def destroy

  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def set_posts
    @posts = Post.find()
  end

  def list_param
    params.require(:list).allow[:description, :due_date, :status]
  end
end

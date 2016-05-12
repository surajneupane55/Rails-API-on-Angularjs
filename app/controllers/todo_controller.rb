class TodoController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def template
    render :template => 'todo/' + params[:path], :layout => nil
  end

end

class TasksController < ApplicationController
  before_action :authenticate_user!

  before_action :prepare_task, only: %i[show update destroy]

  def index
    @tasks = authorize Task.where(user_id: current_user.id)
  end

  def new
    @task = authorize Task.new
  end

  def show; end

  def create
    @task = authorize Task.new(task_params)
    @task.user_id = current_user.id
    if @task.save
      render json: {
        success: true,
        data: @task
      }
    else
      render json: {
        success: false,
        data: @task
      }
    end
  end

  def update
    if @task.update(task_params)
      render json: {
        success: true,
        data: @task
      }
    else
      render json: {
        success: false,
        data: @task
      }
    end
  end

  def destroy
    if @task.destroy
      render json: {
        success: true,
        data: @task
      }
    else
      render json: {
        success: false,
        data: @task
      }
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :detail)
  end

  def prepare_task
    @task = authorize Task.find(params[:id])
  end
end

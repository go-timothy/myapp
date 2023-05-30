class TasksController < ApplicationController
    before_action :authenticate_user!

    def index
        @tasks = Task.where(user_id: current_user.id)
    end

    def new
        @task = authorize Task.new
    end

    def show
        @task = authorize Task.find(params[:id])
    end

    def create
        @task = authorize Task.new(task_params)
        @task.user_id = current_user.id
        if @task.save
            redirect_to action: "index"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        @task = authorize Task.find(params[:id])

        if @task.update(task_params)
            redirect_to action: "index"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @task = authorize Task.find(params[:id])

        if @task.destroy()
            redirect_to action: "index"
        else
            render :new, status: :unprocessable_entity
        end
    end

    private
    def task_params
      params.require(:task).permit(:title, :detail)
    end
end

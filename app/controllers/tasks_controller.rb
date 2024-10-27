class TasksController < ApplicationController
    def index
      @tasks = Task.where(status: 'incomplete')
      @task = Task.new
    end
   
    def create
      @task = Task.new(task_params)
      if @task.save
        redirect_to tasks_path
      else
        @tasks = Task.all
        render :index
      end
    end
   
    def complete
      @task = Task.find(params[:id])
      @task.update(status: 'complete')
      redirect_to tasks_path, notice: 'Task was marked as complete.'
    end
   
    private
   
    def task_params
      params.require(:task).permit(:title, :status, :category_id) # ต้องแน่ใจว่ารวม category_id ด้วย
    end
  end
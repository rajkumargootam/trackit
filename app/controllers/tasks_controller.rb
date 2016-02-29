class TasksController < ApplicationController
  def index
    @not_started_tasks = Task.where(status: Task::Status::NOT_STARTED)
    @in_progress_tasks = Task.where(status: Task::Status::IN_PROGRESS)
    @finished_tasks = Task.where(status: Task::Status::FINISHED)
    flash.now[:notice] = "Error!!!"
  end
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attribute(:status, params[:status].to_i)
  end
  private
  def task_params
    params.require(:task).permit(:title)
  end
end

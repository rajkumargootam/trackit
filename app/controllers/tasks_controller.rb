class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @not_started_tasks = current_user.tasks.where(status: Task::Status::NOT_STARTED)
    @in_progress_tasks = current_user.tasks.where(status: Task::Status::IN_PROGRESS)
    @finished_tasks = current_user.tasks.where(status: Task::Status::FINISHED)
    @shared_tasks = current_user.shared_tasks
  end
  def new
    @task = current_user.tasks.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def update
    @task = current_user.tasks.find(params[:id])
    @task.update_attribute(:status, params[:status].to_i)
  end
  private
  def task_params
    params.require(:task).permit(:title)
  end
end

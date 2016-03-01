class SharedTasksController < ApplicationController
  before_action :authenticate_user!
  before_action :fetch_new_shared_task, only: [:new, :create]

  def index
    @shared_tasks = current_user.shared_tasks.includes(:task)
  end

  def new
  end

  def create
    @shared_task = SharedTask.new
    @shared_task.task = @task
    @shared_task.user = User.find_by(email: params[:shared_task][:email])
    if @shared_task.save
      redirect_to tasks_path
    else
      flash.now[:danger] = @shared_task.errors.full_messages.join(". ")
      render :new
    end
  end

private
  def fetch_new_shared_task
    @task = current_user.tasks.find(params[:task_id] || params[:shared_task][:task_id])
    @shared_task = @task.shared_tasks.new
  end
end

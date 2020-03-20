class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]
  before_action :check_task_exist?, only: %i[show edit update destroy]
  def index
    @tasks = Task.all
  end

  def show

  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = "Create Task successfully"
      redirect_to task_path(@task)
    else
      flash[:alert] = "Create Task Failed"
      render new_task_path
    end
  end

  def edit

  end

  def update
    if @task.update(task_params)
      flash[:notice] = "Update Task successfully"
      redirect_to task_path(@task)
    end
  end

  def destroy
    if @task.present?
      @task.destroy
      flash[:notice] = "Destroy Task successfully"
    end
    redirect_to root_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :content)
  end

  def set_task
    @task = Task.find_by(id: params[:id])
  end

  def check_task_exist?
    if @task.nil?
      flash[:alert] = "This Task not exist"
      redirect_to root_path
    end
  end

end

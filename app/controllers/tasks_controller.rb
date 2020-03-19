class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.all
  end

  def show
    redirect_to root_path if @task.nil?
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task)
    else
      render new_task_path
    end
  end

  def edit
    redirect_to root_path if @task.nil?
  end

  def update
    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      render root_path
    end
  end

  def destroy
    @task.destroy if @task.present?
    redirect_to root_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :content)
  end

  def set_task
    @task = Task.find_by(id: params[:id])
  end

end

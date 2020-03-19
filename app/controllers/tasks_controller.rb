class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find_by(id: params[:id])
    if @task.nil?
      return redirect_to root_path
    end
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
    @task = Task.find_by(id: params[:id])
  end

  def update
    @task = Task.find_by(id: params[:id])
    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      render root_path
    end
  end

  def destroy
    @task = Task.find_by(id: params[:id])
    if @task.present?
      @task.destroy
    end
    redirect_to root_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :content)
  end

end

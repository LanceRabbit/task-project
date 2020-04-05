class TasksController < ApplicationController
  before_action :authenticate_user

  before_action :set_task, only: %i[show edit update destroy execute finish]
  before_action :check_task_exist?, only: %i[show edit update destroy execute finish]

  def index
    @q = Task.ransack(params[:q])
    @tasks = @q.result
      .order_created(sort_params(params[:sort].try(&:to_sym)))
      .page(params[:page])
      .per(3)
  end

  def show

  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user = User.first
    if @task.save
      flash[:notice] = t(".notice")
      redirect_to task_path(@task)
    else
      flash[:alert] = t(".alert")
      render new_task_path
    end
  end

  def edit

  end

  def update
    if @task.update(task_params)
      flash[:notice] = t(".notice")
      redirect_to task_path(@task)
    else
      flash[:alert] = t(".alert")
      render :action => 'edit'
    end
  end

  def destroy
    if @task.present?
      @task.destroy
      flash[:notice] = t(".notice")
    end
    redirect_to root_path
  end

  def execute
    if @task.todo?
      @task.execute!
    end
    redirect_back(fallback_location: root_path)
  end

  def finish
    if !@task.completed?
      @task.finish!
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def sort_params(type)
    Task::SORT_OPTIONS[type] || Task::SORT_OPTIONS[:created_at]
  end

  def task_params
    params.require(:task).permit(:title, :content, :start_date, :end_date, :priority)
  end

  def set_task
    @task = Task.find_by(id: params[:id])
  end

  def check_task_exist?
    if @task.nil?
      flash[:alert] = t(".alert")
      redirect_to root_path
    end
  end

end

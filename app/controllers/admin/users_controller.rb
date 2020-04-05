class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: %i[edit update show destroy]
  before_action :check_user_exist?, only: %i[edit update show destroy]

  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
    @q = Task.ransack(params[:q])
    @tasks = @q.result
      .order_created(@user.id, Task::SORT_OPTIONS[:created_at])
      .page(params[:page])
      .per(3)
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def check_user_exist?
    if @user.nil?
      flash[:alert] = t(".alert")
      redirect_to admin_root_path
    end
  end
end

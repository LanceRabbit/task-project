class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: %i(edit update show destroy)
  before_action :check_user_exist?, only: %i(edit update show destroy)

  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
    @q = Task.ransack(params[:q])
    @tasks = @q.result
      .order_created(@user.id, Task::SORT_OPTIONS[:created_at])
      .page(params[:page])
      .per(10)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = t('.notice')
      redirect_to admin_root_path
    else
      flash[:alert] = t('.alert')
      render new_admin_user_path
    end
  end

  def edit
    if @user.id == current_user.id
      flash[:alert] = t(".warning")
      redirect_to admin_root_path
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = t(".notice")
      redirect_to admin_user_path(@user)
    else
      flash[:alert] = t(".alert")
      render :action => 'edit'
    end
  end

  def destroy
    if @user.destroy
      flash[:notice] = t('.notice')
      redirect_to admin_root_path
    else
      flash[:alert] = @user.errors[:base][0]
      redirect_to admin_root_path
    end
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def check_user_exist?
    if @user.nil?
      flash[:alert] = t(".alert")
      redirect_to admin_root_path
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
  end
end

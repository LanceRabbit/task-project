class Admin::UsersController < Admin::BaseController
  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
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
end

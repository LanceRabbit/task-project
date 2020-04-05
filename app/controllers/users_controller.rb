class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :check_email, only: :create
  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = t('.notice')
      redirect_to root_path
    else
      flash[:alert] = t('.alert')
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def check_email
    @user = User.find_by(email: params[:user][:email])
    if @user.present?
      flash[:alert] = t(".duplicated")
      render :new
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

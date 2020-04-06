class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def authenticate_user
    unless current_user
      flash[:alert] = t('users.authenticate')
      return redirect_to login_path
    end
  end

  def render_404
    render file: "#{Rails.root}/public/404", status: :not_found, layout: false
  end

end

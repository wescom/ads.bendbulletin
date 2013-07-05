class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def require_admin
    unless current_user.has_role? :admin
      redirect_to root_path
      return false
    end
  end

  def require_edit
    unless current_user.has_role? :edit
      redirect_to root_path
      return false
    end
  end
end

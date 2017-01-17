class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    if current_user
      redirect_to main_app.root_path, alert: I18n.t('flash.errors.access_denied')
    else
      redirect_to main_app.new_user_session_path, alert: I18n.t('flash.errors.access_denied_login')
    end
  end
end

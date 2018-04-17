class ApplicationController < ActionController::Base
  include ApplicationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger
  
  #def after_sign_in_path_for(resource)
  #  articles_path # ログイン後に遷移するpathを設定
  #end
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name,:image])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:randomkey])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:image])
    
  end
  
  def after_sign_in_path_for(resource)
  '/articles'
  end
end

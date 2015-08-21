class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def authorize_admin!
    if current_user.nil? || !current_user.is_admin?
      flash[:notice] = "You are not authorized to view this resource."
      redirect_to_root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [
      :username,
      :first_name,
      :last_name,
      :description,
      :city,
      :state,
      :website,
      :profile_photo
    ]
  end
end

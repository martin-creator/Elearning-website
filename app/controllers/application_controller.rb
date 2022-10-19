class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    # we added this code to tell devise about the new user field-name
    def configure_permitted_parameters

        devise_parameter_sanitizer.permit(:sign_up)  { |u| u.permit( :name, :email, :password, :remember_me) }
        devise_parameter_sanitizer.permit(:sign_in)  { |u| u.permit( :name, :email, :password, :remember_me) }
        devise_parameter_sanitizer.permit(:account_update)  { |u| u.permit( :name, :email, :password, :current_password) }
    end

end

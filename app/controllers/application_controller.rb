class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :remember_me])
        devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :email, :password, :remember_me])
        devise_parameter_sanitizer.permit(:acount_update, keys: [:name, :email, :password, :current_password])
    end
end
